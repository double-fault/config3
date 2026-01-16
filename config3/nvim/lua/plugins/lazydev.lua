return {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    version = "1.9.0", -- some error with the latest version, https://www.reddit.com/r/neovim/comments/1ninaou/started_seem_this_error_after_updated_my_packages/
    opts = {
        library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
    },
}
