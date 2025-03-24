return {
    'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig').pyright.setup{}
      require('lspconfig').gopls.setup{}
      require('lspconfig').clangd.setup{}
    end
  }

