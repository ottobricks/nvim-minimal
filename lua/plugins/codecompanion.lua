return {
    "olimorris/codecompanion.nvim",
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
    config = function()
        -- require("codecompanion").setup({
        --     adapters = {
        --         chat = require("codecompanion.adapters").use(
        --             "ollama",
        --             { schema = { model = { default = "qwen2.5-coder:3b" } } }
        --         ),
        --         inline = require("codecompanion.adapters").use(
        --             "ollama",
        --             { schema = { model = { default = "qwen2.5-coder:3b" } } }
        --         ),
        --     },
        -- })
        require("codecompanion").setup({
            strategies = {
                chat = {
                    adapter = {
                        name = "ollama",
                        model = "qwen2.5-coder:3b",
                    },
                },
                inline = {
                    adapter = {
                        name = "ollama",
                        model = "qwen2.5-coder:3b",
                    },
                },
            },
        })
    end,
}
