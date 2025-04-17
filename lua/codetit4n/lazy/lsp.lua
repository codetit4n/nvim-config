return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },

  config = function()
    local function get_highest_version(versions)
      table.sort(versions, function(a, b)
        local function version_to_tuple(v)
          local major, minor, patch = v:match("(%d+)%.(%d+)%.?(%d*)")
          return tonumber(major), tonumber(minor), tonumber(patch or "0")
        end
        local a1, a2, a3 = version_to_tuple(a)
        local b1, b2, b3 = version_to_tuple(b)

        if a1 ~= b1 then
          return a1 < b1
        elseif a2 ~= b2 then
          return a2 < b2
        else
          return a3 < b3
        end
      end)

      return versions[#versions] -- highest version
    end

    local function parse_remappings()
      local remappings = {}
      local remappings_file = vim.fn.findfile("remappings.txt", ".;")
      if remappings_file == "" then
        return remappings
      end

      for line in io.lines(remappings_file) do
        local key, value = line:match("^(.-)%s*=%s*(.+)$")
        if key and value then
          remappings[key] = value
        end
      end
      return remappings
    end

    local function get_solidity_version()
      local foundry_toml = vim.fs.find("foundry.toml", { upward = true, type = "file" })
      if #foundry_toml > 0 then
        for line in io.lines(foundry_toml[1]) do
          local version = line:match('solc_version%s*=%s*"(.-)"')
          if version then
            return version
          end
        end
      end

      local hardhat_config = vim.fs.find({ "hardhat.config.js", "hardhat.config.ts" }, { upward = true, type = "file" })
      if #hardhat_config > 0 then
        local versions = {}
        for line in io.lines(hardhat_config[1]) do
          for version in line:gmatch('version:%s*"(.-)"') do
            table.insert(versions, version)
          end
        end
        if #versions > 0 then
          return get_highest_version(versions)
        end
      end

      return "latest"
    end

    -- Setup
    local border = "rounded"
    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "rust_analyzer",
        "jedi_language_server",
        "clangd",
        "docker_compose_language_service",
        "dockerls",
        "bashls",
        "csharp_ls",
        "asm_lsp",
        "solidity_ls",
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = Capabilities,
            handlers = handlers,
          })
        end,
        ["solidity_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.solidity_ls.setup({
            cmd = { "vscode-solidity-server", "--stdio" },
            filetypes = { "solidity" },
            root_dir = lspconfig.util.root_pattern("foundry.toml", "hardhat.config.*"),
            settings = {
              solidity = {
                compileUsingRemoteVersion = get_solidity_version(),
                defaultCompiler = "remote",
                enabledAsYouTypeCompilationErrorCheck = true,
                remapping = parse_remappings(),
              },
            },
            capabilities = Capabilities,
            handlers = handlers,
          })
        end,
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            capabilities = Capabilities,
            handlers = handlers,
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = {
                  globals = { "vim", "it", "describe", "before_each", "after_each" },
                },
              },
            },
          })
        end,
      },
    })

    -- Rust analyzer (separately)
    require("lspconfig").rust_analyzer.setup({
      capabilities = Capabilities,
      handlers = handlers,
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            buildScripts = { enable = true },
          },
        },
      },
    })

    -- Custom LSPs
    local lspconfig = require("lspconfig")
    local configs = require("lspconfig.configs")

    -- Aptos Move
    if not configs.aptos_move_analyzer then
      configs.aptos_move_analyzer = {
        default_config = {
          cmd = { "aptos-move-analyzer" },
          filetypes = { "move" },
          root_dir = function(fname)
            return vim.fs.dirname(vim.fs.find({ "Move.toml" }, { upward = true })[1])
          end,
          settings = {},
        },
      }
    end

    lspconfig.aptos_move_analyzer.setup({
      capabilities = Capabilities,
      handlers = handlers,
    })

    -- Fuel Sway
    if not configs.sway_lsp then
      configs.sway_lsp = {
        default_config = {
          cmd = { "forc-lsp" },
          filetypes = { "sway" },
          init_options = {
            logging = { level = "trace" },
          },
          root_dir = function(fname)
            return vim.fs.dirname(vim.fs.find({ "Forc.toml" }, { upward = true })[1])
          end,
          settings = {},
        },
      }
    end

    lspconfig.sway_lsp.setup({
      capabilities = Capabilities,
      handlers = handlers,
    })
  end,
}

