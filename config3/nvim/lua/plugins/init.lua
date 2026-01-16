return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "cpp",
                    "python",
                    "xml",
                    "lua",
                    "vim",
                    "bash",
                    "c",
                    "diff",
                    "html",
                    "markdown",
                    "markdown_inline",
                    "ruby",
                    "vimdoc",
                    "query",
                },
                auto_install = true,
                highlight = {
                    enable = true,
                    use_languagetree = true,
                },
                indent = { enable = false },
            })
        end,
    },
    {
        "NMAC427/guess-indent.nvim",
        lazy = false,
        config = function()
            require("guess-indent").setup()
        end,
    },
}
