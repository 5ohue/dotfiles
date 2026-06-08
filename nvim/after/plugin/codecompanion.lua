function make_adapter(_model)
    return function()
        return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
                url = "http://127.0.0.1:8012",
                api_key = "TERM",
                chat_url = "/v1/chat/completions",
            },
            schema = {
                model = { default = _model }, -- Your coder model
            },
            handlers = {
                parse_message_meta = function(self, data)
                    local extra = data.extra
                    if extra and extra.reasoning_content then
                        data.output.reasoning = { content = extra.reasoning_content }
                        if data.output.content == "" then
                            data.output.content = nil
                        end
                    end
                    return data
                end,
            },
        })
    end
end

require("codecompanion").setup({
    adapters = {
        http = {
            -- qwen3 = make_adapter("Jackrong/Qwopus3.5-9B-Coder-MTP-GGUF:Q8_0"),
            qwen3 = make_adapter("unsloth/Qwen3.6-35B-A3B-MTP-GGUF:MXFP4_MOE"),
            qwen2coder = make_adapter("unsloth/Qwen2.5-Coder-14B-Instruct-128K-GGUF:Q4_K_M"),
        },
    },
    interactions = {
        chat = {
            adapter = "qwen3",
            opts = {
                completion_provider = "cmp",
            },
        },
        inline = {
            adapter = "qwen3",
            keymaps = {
                accept_change = {
                    modes = { n = "ga" },
                    description = "Accept the suggested change",
                },
                reject_change = {
                    modes = { n = "gr" },
                    description = "Reject the suggested change",
                },
            },
        },
        cmd = {
            adapter = "qwen3",
        },
    },
    opts = {
        -- Set debug logging
        log_level = "DEBUG",
    },
    display = {
        action_palette = {
            width = 95,
            height = 10,
            prompt = "Prompt ",
            provider = "telescope",
            opts = {
                show_default_actions = true,
                show_default_prompt_library = true,
                title = "CodeCompanion actions",
            },
        },
    },
    prompt_library = {
        markdown = {
            dirs = {
                -- Relative
                vim.fn.getcwd() .. "/.prompts",
                -- Absolute
                "~/.config/nvim/.prompts",
            },
        },
    },
})
