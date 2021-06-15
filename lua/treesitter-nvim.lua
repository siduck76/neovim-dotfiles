local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
        "javascript",
        "html",
        "css",
        "bash",
        "lua",
        "json",
        "python",
        -- "c",
        -- "c_sharp",
        -- "clojure",
        -- "comment",
        -- "cpp",
        -- "commonlisp",
        -- "cuda",
        -- "dart",
        -- "devicetree",
        -- "dockerfile",
        -- "elixir",
        -- "erlang",
        -- "go",
        -- "fish",
        -- "haskell",
        -- "java",
        -- "jsdoc",
        -- "graphql",
        -- "julia",
        -- "kotlin",
        -- "ledger",
        -- "latex",
        -- "php",
        -- "nix",
        -- "ocamel",
        -- "ql",
        -- "regex",
        -- "ruby",
        -- "rust",
        -- "rst",
        -- "scss",
        -- "sparql",
        -- "teal",
        -- "toml",
        -- "typescript",
        -- "vue",
        -- "yaml",
        -- "zig"
    },
  -- ignore_install = { "php" }, -- List of parsers to ignore installing
    highlight = {
        enable = true,
        use_languagetree = true
    }
}

-- Treesitter Based indentation
ts_config.setup {
  indent = {
    enable = true
  }
}
