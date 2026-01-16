return {
    'saghen/blink.cmp',

    -- use a release tag to download pre-built binaries
    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- Defaults: 
        --['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        --['<C-e>'] = { 'hide', 'fallback' },
        --['<C-y>'] = { 'select_and_accept', 'fallback' },

        --['<Up>'] = { 'select_prev', 'fallback' },
        --['<Down>'] = { 'select_next', 'fallback' },
        --['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        --['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

        --['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        --['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        --['<Tab>'] = { 'snippet_forward', 'fallback' },
        --['<S-Tab>'] = { 'snippet_backward', 'fallback' },

        --['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
        keymap = {
            preset = 'default',

            ['<C-y>'] = { 'select_and_accept', 'fallback' },
            ['<C-j>'] = { 'select_and_accept', 'fallback' },
            ['<C-e>'] = { 'select_and_accept', 'fallback' },
            ['<CR>'] = { 'select_and_accept', 'fallback' },

            ['<C-l>'] = { 'hide', 'fallback' },

            ['<C-space>'] = false,                                            -- as this is my tmux prefix
            ['<C-s>'] = { 'show', 'show_documentation', 'hide_documentation' } -- let C-s do what C-space did
        },

        appearance = {
            nerd_font_variant = 'mono'
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'buffer' },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
}
