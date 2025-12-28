return {
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "snacks.nvim", words = { "Snacks" } },
                { path = "lazy.nvim", words = { "LazyVim" } },
            },
        },
    },
    {
        -- optional blink completion source for require statements and module annotations
        "saghen/blink.cmp",
        -- build = "cargo build --release",
        version = "1.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        fuzzy = { implementation = "prefer_rust_with_warning" },
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- keymap = {
            --     ["<A-y>"] = require("minuet").make_blink_map(),
            -- },
            keymap = {
                preset = "enter",
                ["<S-Tab>"] = { "select_prev", "fallback" },
                ["<Tab>"] = { "select_next", "fallback" },
            },
            sources = {
                default = {
                    "lazydev",
                    "lsp",
                    "path",
                    "snippets",
                    "buffer",
                    "minuet",
                    "codecompanion",
                },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                    minuet = {
                        name = "minuet",
                        module = "minuet.blink",
                        async = true,
                        -- Should match minuet.config.request_timeout * 1000,
                        -- since minuet.config.request_timeout is in seconds
                        timeout_ms = 3000,
                        score_offset = 50, -- Gives minuet higher priority among suggestions
                    },
                },
                per_filetype = {
                    codecompanion = { "codecompanion" },
                },
            },
            -- completion = { trigger = { prefetch_on_insert = false } },
        },
        opts_extend = { "sources.default" },
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
}
