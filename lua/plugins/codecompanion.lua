return {
    "olimorris/codecompanion.nvim",
    lazy = true,
    -- dev = true,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-lua/plenary.nvim",
        {
            "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
            opts = {},
        },
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
                http = {
                    ollama = function()
                        return require("codecompanion.adapters").extend("ollama", {
                            schema = {
                                model = {
                                    -- default = "qwen2.5-coder:7b-instruct-q5_K_M",
                                    default = "qwen3-coder:30b-a3b-q4_K_M",
                                    -- default = "qwen2.5-coder:3b",
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
