return {
    "olimorris/codecompanion.nvim",
    version = "18.3.0",
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
    config = function()
        require("codecompanion").setup({
            adapters = {
                http = {
                    ollama = function()
                        return require("codecompanion.adapters").extend("openai_compatible", {
                            name = "ollama",
                            env = {
                                url = "http://localhost:11434",
                                allow_insecure = true,
                                -- chat_url = "/v1/chat/completions",
                            },
                            schema = {
                                model = {
                                    default = "deepseek-r1:7b-qwen-distill-q4_K_M",
                                },
                            },
                        })
                    end,
                },
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
}
--     opts = {
--         -- cmd = {
--         --     "CodeCompanion",
--         --     "CodeCompanionChat",
--         --     "CodeCompanionToggle",
--         --     "CodeCompanionActions",
--         -- },
--         -- adapters = {
--         --     http = {
--         --         ollama = function()
--         --             return require("codecompanion.adapters").extend("ollama", {
--         --                 schema = {
--         --                     model = {
--         --                         default = "deepseek-r1:7b-qwen-distill-q4_K_M",
--         --                     },
--         --                 },
--         --                 env = {
--         --                     url = "http://localhost:11434",
--         --                     allow_insecure = true,
--         --                     -- chat_url = "/v1/chat/completions",
--         --                 },
--         --             })
--         --         end,
--         --     },
--         -- },
--         interactions = {
--             chat = {
--                 adapter = { name = "ollama", model = "deepseek-r1:7b-qwen-distill-q4_K_M" },
--                 -- adapter = "ollama",
--             },
--             -- inline = {
--             --     adapter = {
--             --         name = "ollama",
--             --         model = "deepseek-r1:7b-qwen-distill-q4_K_M",
--             --         keymaps = {
--             --             accept_change = {
--             --                 modes = { n = "ga" },
--             --                 description = "Accept the suggested change",
--             --             },
--             --             reject_change = {
--             --                 modes = { n = "gr" },
--             --                 opts = { nowait = true },
--             --                 description = "Reject the suggested change",
--             --             },
--             --         },
--             --     },
--             -- },
--             background = {
--                 adapter = { name = "ollama", model = "deepseek-r1:7b-qwen-distill-q4_K_M" },
--             },
--             -- agent = {
--             --     adapter = "ollama",
--             --     model = "qwen2.5-coder:7b-base-q6_K",
--             -- },
--         },
--         opts = {
--             log_level = "DEBUG",
--         },
--     },
-- }
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
