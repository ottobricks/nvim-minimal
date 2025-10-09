return {
    "olimorris/codecompanion.nvim",
    lazy = false,
    -- dev = true,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-lua/plenary.nvim",
        -- {
        --     "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
        --     opts = {},
        -- },
    },
    cmd = {
        "CodeCompanion",
        "CodeCompanionChat",
        "CodeCompanionToggle",
        "CodeCompanionActions",
    },
    config = true,
    init = function()
        require("codecompanion").setup({
            adapters = {
                ollama = function()
                    return require("codecompanion.adapters").extend("ollama", {
                        schema = {
                            model = {
                                default = "qwen3:8b",
                                -- default = "deepseek-coder-v2:16b",
                                -- default = 'codeqwen:7b',
                            },
                        },
                        env = {
                            url = "http://127.0.0.1:11434",
                        },
                    })
                end,
            },
            strategies = {
                chat = {
                    adapter = "ollama",
                },
                inline = {
                    adapter = "ollama",
                },
                agent = {
                    adapter = "ollama",
                },
            },
        })
    end,
    -- config = function()
    --     require("codecompanion").setup({
    --         adapters = {
    --             chat = require("codecompanion.adapters").use(
    --                 "ollama",
    --                 { schema = { model = { default = "qwen3:8b" } } }
    --             ),
    --             inline = require("codecompanion.adapters").use(
    --                 "ollama",
    --                 { schema = { model = { default = "qwen3:8b" } } }
    --             ),
    --         },
    --     })
    -- end,
    -- opts = {
    --     strategies = {
    --         chat = {
    --             adapter = "ollama",
    --             model = "qwen3:8b",
    --         },
    --         inline = {
    --             adapter = "ollama",
    --             model = "qwen3:8b",
    --         },
    --         cmd = {
    --             adapter = "ollama",
    --             model = "qwen3:8b",
    --         },
    --     },
    --     opts = {
    --         log_level = "DEBUG",
    --     },
    -- },
}
