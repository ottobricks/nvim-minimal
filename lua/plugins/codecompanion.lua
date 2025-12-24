return {
    "olimorris/codecompanion.nvim",
    version = "v17.33.0",
    -- event = "LspAttach",
    -- enabled = true,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-lua/plenary.nvim",
        -- {
        --     "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
        --     opts = {},
        -- },
    },
    opts = {
        cmd = {
            "CodeCompanion",
            "CodeCompanionChat",
            "CodeCompanionToggle",
            "CodeCompanionActions",
        },
        strategies = {
            chat = {
                adapter = "ollama",
                model = "qwen2.5-coder:1.5b-base-q6_K",
            },
            inline = {
                adapter = "ollama",
                model = "qwen2.5-coder:1.5b-base-q6_K",
                keymaps = {
                    accept_change = {
                        modes = { n = "ga" },
                        description = "Accept the suggested change",
                    },
                    reject_change = {
                        modes = { n = "gr" },
                        opts = { nowait = true },
                        description = "Reject the suggested change",
                    },
                },
            },
            agent = {
                adapter = "ollama",
                model = "qwen2.5-coder:1.5b-base-q6_K",
            },
        },
        opts = {
            log_level = "DEBUG",
        },
    },
}
-- config = true,
-- init = function()
--     require("codecompanion").setup({
--         adapters = {
--             http = {
--                 ollama = function()
--                     return require("codecompanion.adapters").extend("ollama", {
--                         schema = {
--                             model = {
--                                 default = "ollama/qwen2.5-coder:1.5b-base-q6_K",
--                                 -- default = "qwen2.5-coder:7b-instruct-q5_K_M",
--                                 -- default = "qwen3-coder:30b-a3b-q4_K_M",
--                                 -- default = "qwen2.5-coder:3b",
--                                 -- default = "deepseek-coder-v2:16b",
--                                 -- default = 'codeqwen:7b',
--                             },
--                         },
--                         env = {
--                             url = "http://127.0.0.1:11434",
--                         },
--                     })
--                 end,
--             },
--         },
--         strategies = {
--             chat = {
--                 adapter = "ollama",
--             },
--             inline = {
--                 adapter = "ollama",
--                 keymaps = {
--                     accept_change = {
--                         modes = { n = "ga" },
--                         description = "Accept the suggested change",
--                     },
--                     reject_change = {
--                         modes = { n = "gr" },
--                         opts = { nowait = true },
--                         description = "Reject the suggested change",
--                     },
--                 },
--             },
--             agent = {
--                 adapter = "ollama",
--             },
--         },
--     })
-- end,
