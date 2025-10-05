return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            local telescope = require("telescope")
            local nvchad_telescope = require("nvchad.configs.telescope")

            telescope.setup(vim.tbl_deep_extend('force', nvchad_telescope or {}, {
                defaults = {
                    file_ignore_patterns = {
                        "%.git/",
                        "__pycache_/",
                        "%.pyc",
                        "%.mypy_cache/",
                        "target/",
                        "bin/",
                        "obj/",
                        "node_modules/"
                    }
                }
            })
        )
        end,

    }
}
