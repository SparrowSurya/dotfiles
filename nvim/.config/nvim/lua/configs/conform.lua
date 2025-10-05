local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        python = { "ruff" },
        rust = { "rust-analyzer" },
    },

    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

return options
