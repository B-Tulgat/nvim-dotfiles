return {
    {
    "sainnhe/gruvbox-material",
    config = function()
        vim.g.gruvbox_material_background = "soft" -- or "hard"
        vim.g.gruvbox_material_enable_bold = 1
        vim.g.gruvbox_material_enable_italic = 0
        vim.o.background = "dark" -- or "dark"
        vim.cmd([[colorscheme gruvbox-material]])
    end,
}

}

