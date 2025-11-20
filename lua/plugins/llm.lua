return {
    "huggingface/llm.nvim",
    opts = {
        backend = "ollama", -- backend ID, "huggingface" | "ollama" | "openai" | "tgi"
        url = "http://localhost:11434", -- the http url of the backend
        -- adaptor = "ollama",
        -- request_body = { model = "starcoder2:3b" },
        -- model = "starcoder2:3b",
        -- model = "jcdickinson/wizardcoder:15b-q4_k_m",
        model = "qwen2.5-coder:7b-instruct-q5_K_M",
        tokens_to_clear = { "<|endoftext|>", "<|file_sep|>", "<|fim_pad|>", "<|cursor|>" },
        fim = {
            enabled = true,
            prefix = "<|fim_prefix|>",
            middle = "<|fim▁middle|>",
            suffix = "<|fim▁suffix|>",
        },
        debounce_ms = 150,
        -- fim = {
        --     enabled = true,
        --     prefix = "<fim_prefix>",
        --     middle = "<fim_middle>",
        --     suffix = "<fim_suffix>",
        -- },
        -- request_body = {
        --     options = { -- https://github.com/ollama/ollama/blob/main/docs/api.md#generate-request-with-options
        --         num_ctx = 1088,
        --         temperature = 0.2,
        --         num_predict = 64,
        --         top_p = 0.1,
        --         top_k = 40,
        --     },
        --     keep_alive = "1h",
        --     raw = true,
        -- },
        -- content_window = 1024,
        tokenizer = {
            repository = "Qwen/Qwen2.5-Coder-7B",
        },
        accept_keymap = "<Tab>",
        -- dismiss_keymap = "<Left>",
    },
    event = "VeryLazy",
    enabled = false,
}
-- return {
--     "huggingface/llm.nvim",
--     -- event = "VeryLazy",
--     event = "BufEnter",
--     enabled = true,
--     opts = {
--         -- model = "qwen2.5-coder:3b", -- the model ID, behavior depends on backend
--         -- model = "qwen3-coder:30b-a3b-q4_K_M",
--         -- model = "qwen2.5-coder:7b-instruct-q5_K_M",
--         tokens_to_clear = { "<|endoftext|>", "<|file_sep|>", "<|fim_pad|>", "<|cursor|>" },
--         model = "codeqwen:7b-code-v1.5-q4_0",
--         backend = "ollama", -- backend ID, "huggingface" | "ollama" | "openai" | "tgi"
--         url = "http://localhost:11434", -- the http url of the backend
--         request_body = {
--             options = { -- https://github.com/ollama/ollama/blob/main/docs/api.md#generate-request-with-options
--                 num_ctx = 1088,
--                 temperature = 0.2,
--                 num_predict = 64,
--                 top_p = 0.0,
--                 top_k = 40,
--             },
--             keep_alive = "1h",
--             raw = true,
--         },
--         -- set this if the model supports fill in the middle
--         fim = {
--             enabled = true,
--             prefix = "<|fim_prefix|>",
--             middle = "<|fim▁middle|>",
--             suffix = "<|fim▁suffix|>",
--         },
--         debounce_ms = 150,
--         accept_keymap = "<Tab>",
--         -- dismiss_keymap = "<S-C>",
--         tls_skip_verify_insecure = false,
--         -- llm-ls configuration, cf llm-ls section
--         -- lsp = {
--         --     bin_path = nil,
--         --     host = nil,
--         --     port = nil,
--         --     version = "0.5.3",
--         -- },
--         -- lsp = {
--         --     bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/mason/bin/llm-ls",
--         --     cmd_env = { LLM_LOG_LEVEL = "DEBUG" },
--         -- },
--         tokenizer = { repository = "Qwen/Qwen2.5-Coder-7B" },
--         context_window = 1088, -- max number of tokens for the context window
--         enable_suggestions_on_startup = true,
--         enable_suggestions_on_files = "*", -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
--         disable_url_path_completion = false, -- cf Backend
--     },
-- }
