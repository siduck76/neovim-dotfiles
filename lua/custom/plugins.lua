local is_macbook = vim.fn.has("mac") == 1
local one_drive_notes

if is_macbook then
   one_drive_notes = "/Users/edwinmuraya/Library/CloudStorage/OneDrive-Personal/learning_notes"
else
  one_drive_notes = ""
end

local plugins = {
  {
    "rest-nvim/rest.nvim",
    event = "VeryLazy",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          -- show the generated curl command in case you want to launch
          -- the same request via the terminal (can be verbose)
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
            end
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
      })
    end
  },
   {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#omnisharp
        omnisharp = {
          organize_imports_on_format = true,
          enable_import_completion = true,
        },
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "netcoredbg",
        "rust-analyzer"
      }
    }
  },{
     "rust-lang/rust.vim",
      ft="rust",
      init=function()
        vim.g.rustfmt_autosave = 1
      end
  },{
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust_tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end
  }, {
       "github/copilot.vim",
        event = "VeryLazy",
  },
  {
    'nvim-orgmode/orgmode',
    event = "VeryLazy",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = {'org'},
    config = function()
            require('orgmode').setup_ts_grammar();
            require('orgmode').setup{
             org_agenda_files = { one_drive_notes, '~/.system_notes/**/*'},
             org_default_notes_file = one_drive_notes .. "/org_refile.org",
      }
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
     event = "VeryLazy",
     config = function ()
      require'nvim-treesitter.configs'.setup {
       ensure_installed = { "c", "cpp", "cmake" ,"bash", "c_sharp", "rust", "vim", "yaml", "org", "xml", "typescript", "tsx", "sql", "scss", "norg", "markdown", "lua" , "json", "jq", "javascript" , "jsdoc", "http", "html", "gitignore", "gitcommit", "git_rebase", "git_config", "css" },
       sync_install = false,
       auto_install = true,
       highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
     end
  }
}
return plugins
