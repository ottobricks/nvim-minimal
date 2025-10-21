return {
    "huggingface/llm.nvim",
    -- event = "VeryLazy",
    event = "BufEnter",
    enabled = false,
    opts = {
        -- model = "qwen2.5-coder:3b", -- the model ID, behavior depends on backend
        -- model = "qwen3-coder:30b-a3b-q4_K_M",
        model = "qwen2.5-coder:7b-instruct-q5_K_M",
        backend = "ollama", -- backend ID, "huggingface" | "ollama" | "openai" | "tgi"
        url = "http://localhost:11434", -- the http url of the backend
        tokens_to_clear = { "<|endoftext|>", "<|file_sep|>", "<|fim_pad|>", "<|cursor|>" },
        -- tokens_to_clear = { "```python", "```" }, -- tokens to remove from the model's output
        -- tokens_to_clear = {
        --     "<|endoftext|>",
        --     "<|file_sep|>",
        --     "<|fim_pad|>",
        --     "<|cursor|>",
        --     "<|fim_prefix|>",
        --     "<|fim▁middle|>",
        --     "<|fim▁suffix|>",
        -- },
        request_body = {
            options = { -- https://github.com/ollama/ollama/blob/main/docs/api.md#generate-request-with-options
                num_ctx = 1024,
                temperature = 0.2,
                num_predict = 120,
                top_p = 0.95,
            },
            keep_alive = "1h",
            raw = true,
        },
        -- set this if the model supports fill in the middle
        fim = {
            enabled = true,
            prefix = "<|fim_prefix|>",
            middle = "<|fim▁middle|>",
            suffix = "<|fim▁suffix|>",
        },
        debounce_ms = 150,
        accept_keymap = "<Tab>",
        -- dismiss_keymap = "<S-C>",
        tls_skip_verify_insecure = false,
        -- llm-ls configuration, cf llm-ls section
        lsp = {
            bin_path = nil,
            host = nil,
            port = nil,
            version = "0.5.3",
        },
        -- lsp = {
        --     bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/mason/bin/llm-ls",
        --     cmd_env = { LLM_LOG_LEVEL = "DEBUG" },
        -- },
        tokenizer = { repository = "Qwen/Qwen2.5-Coder-1.5B" },
        context_window = 1024, -- max number of tokens for the context window
        enable_suggestions_on_startup = true,
        enable_suggestions_on_files = "*", -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
        disable_url_path_completion = false, -- cf Backend
    },
}
