return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "javascript",
                "typescript",
                "python",
                "htmldjango",
                "rust",
                "go",
                "c",
                "cpp",
                "asm",
                "nasm",
                "json",
                "markdown_inline",
            },
            highlight = {
                enable = true,
                use_languagetree = true,
            },
            indent = {
                enable = true,
            },
        },
    }
}
