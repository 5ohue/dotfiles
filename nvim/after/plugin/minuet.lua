require('minuet').setup({
    cmp = {
        -- Disable by default
        enable_auto_complete = false,
    },
    provider = 'openai_fim_compatible',
    -- provider = 'openai_compatible',
    n_completions = 1,
    context_window = 2048,
    provider_options = {
        openai_fim_compatible = {
            api_key = 'TERM',
            name = 'Llama.cpp',
            end_point = 'http://localhost:8012/v1/completions',
            -- model = 'unsloth/Qwen2.5-Coder-14B-Instruct-128K-GGUF:Q4_K_M',
            model = 'Qwen/Qwen2.5-Coder-7B-Instruct-GGUF:Q6_K',
            optional = {
                max_tokens = 56,
                top_p = 0.9,
            },
            -- Llama.cpp does not support the `suffix` option in FIM completion.
            -- Therefore, we must disable it and manually populate the special
            -- tokens required for FIM completion.
            template = {
                prompt = function(context_before_cursor, context_after_cursor, _)
                    return '<|fim_prefix|>'
                    .. context_before_cursor
                    .. '<|fim_suffix|>'
                    .. context_after_cursor
                    .. '<|fim_middle|>'
                end,
                suffix = false,
            },
        },
        -- openai_compatible = {
        --     api_key = 'TERM',
        --     name = 'Llama.cpp',
        --     end_point = 'http://localhost:8012/v1/chat/completions',
        --     model = 'Qwen/Qwen2.5-Coder-14B-Instruct-GGUF:Q5_K_M',
        --     -- model = 'ai-sage/GigaChat3.1-10B-A1.8B-GGUF:Q8_0',
        --     optional = {
        --         max_tokens = 56,
        --         top_p = 0.9,
        --         reasoning_effort = 'none',
        --     },
        --     -- Llama.cpp does not support the `suffix` option in FIM completion.
        --     -- Therefore, we must disable it and manually populate the special
        --     -- tokens required for FIM completion.
        --     template = {
        --         prompt = function(context_before_cursor, context_after_cursor, _)
        --             return '<|fim_prefix|>'
        --             .. context_before_cursor
        --             .. '<|fim_suffix|>'
        --             .. context_after_cursor
        --             .. '<|fim_middle|>'
        --         end,
        --         suffix = false,
        --     },
        -- },
    },
})
