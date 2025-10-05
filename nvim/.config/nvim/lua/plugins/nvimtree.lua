return {
    {
        'nvim-tree/nvim-tree.lua',
        lazy = false,
        opts = {
            renderer = {
                root_folder_label = ":~:s?$?/..?",
                icons = {
                    glyphs = {
                        default = "󰈚",
                        symlink = "",
                        folder = {
                            default = "󰉋",
                            empty = "",
                            empty_open = "",
                            open = "",
                            symlink = "",
                            symlink_open = "",
                            arrow_open = "",
                            arrow_closed = "",
                        },
                        git = {
                            unstaged = "✗",
                            staged = "✓",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "★",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
                special_files = {
                    "Cargo.toml",
                    "README.md",
                    "Makefile",
                    "requirements.txt",
                    "go.mod",
                    "LICENSE"
                },
            },
        },
    },
    {
        "nvim-tree/nvim-web-devicons",
    }
}
