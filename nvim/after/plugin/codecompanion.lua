require("codecompanion").setup({
    strategies = {
        -- Change the default chat adapter
        chat = {
            adapter = "ollama",
        },
        inline = {
            adapter = "ollama",
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
            adapter = "ollama",
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
            prompt = "Prompt ", -- Prompt used for interactive LLM calls
            provider = "default", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
            opts = {
                show_default_actions = true, -- Show the default actions in the action palette?
                show_default_prompt_library = true, -- Show the default prompt library in the action palette?
            },
        },
    },
    prompt_library = {
        ["Boilerplate HTML"] = {
            strategy = "inline",
            description = "Generate some boilerplate HTML",
            opts = {
                mapping = "<LocalLeader>ch"
            },
            prompts = {
                {
                    role = "system",
                    content = "You are an expert HTML programmer",
                },
                {
                    role = "user",
                    content = "<user_prompt>Please generate some HTML boilerplate for me. Return the code only and no markdown codeblocks</user_prompt>",
                },
            },
        },
        ["Add Comments"] = {
            strategy = "inline",
            description = "Your Special Inline Prompt",
            opts = {
                placement = "replace"
            },
            prompts = {
                {
                    role = "system",
                    content = "I want you to act as a senior developer. For the provided code you MUST NOT change the coding style it was originally written in.",
                },
                {
                    role = "user",
                    content = "<user_prompt>Please add comments to this code sample.</user_prompt>",
                }
            }
        },
        ["Code Expert"] = {
            strategy = "chat",
            description = "Get some special advice from an LLM",
            opts = {
                mapping = "<LocalLeader>ce",
                modes = { "v" },
                short_name = "expert",
                auto_submit = true,
                stop_context_insertion = true,
                user_prompt = true,
            },
            prompts = {
                {
                    role = "system",
                    content = function(context)
                        return "I want you to act as a senior "
                        .. context.filetype
                        .. " developer. I will ask you specific questions and I want you to return concise explanations and codeblock examples."
                    end,
                },
                {
                    role = "user",
                    content = function(context)
                        local text = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

                        return "I have the following code:\n\n```" .. context.filetype .. "\n" .. text .. "\n```\n\n"
                    end,
                    opts = {
                        contains_code = true,
                    }
                },
            },
        },
    },
    adapters = {
        ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
                schema = {
                    model = {
                        default = "qwen2.5-coder:14b",
                    },
                },
                headers = {
                    ["Content-Type"] = "application/json",
                },
                parameters = {
                    sync = true,
                },
            })
        end,
    },
})
