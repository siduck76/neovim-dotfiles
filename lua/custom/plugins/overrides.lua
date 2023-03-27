local M = {}

M.treesitter = {
  ensure_installed = {
    -- "vim",
    -- "lua",
    -- "html",
    -- "css",
    -- "typescript",
    -- "c",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    adaptive_size = true,
    side = "left",
    width = 25,
    hide_root_folder = false,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  -- module = "telescope",
  extensions_list = { "themes", "terms", "xray23", "fzf", "yank_history"},
  -- extensions= {
  --   projects = {
  --     projects = {},
  --   }
  -- },
  defaults = {
    initial_mode = "normal",
    cache_picker = {
      num_pickers = 3,
    },
  },
}

return M