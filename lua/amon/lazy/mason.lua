return {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",

    dependencies = { "mason.nvim", "nvim-lspconfig" },
    config = function()
    require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "gopls", "clangd" }
    })
    end
}

