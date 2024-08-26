
local lsp = require("lsp-zero")

lsp.preset("recommended")


lsp.ensure_installed({
	'pyright',
	'bashls',
	'yamlls',
	'sumneko_lua',
})

lsp.nvim_workspace()

local cmp = require('cmp')
local luasnip = require("luasnip")
local cmp_select = {behavior = cmp.SelectBehavior.Select}

local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.config.disable,
	['<C-e>'] = cmp.config.disable,
	-- toggle completion
	['<C-l>'] = cmp.mapping(function()
		if cmp.visible() then
			cmp.abort()
		else
			cmp.complete()
		end
	end),
	-- navigate snippet placeholders
	['<Tab>'] = cmp.mapping(function(fallback)
		if luasnip.jumpable(1) then
			luasnip.jump(1)
		else
			fallback()
		end
	end, { "i", "s" }),
	['<S-Tab>'] = cmp.mapping(function(fallback)
		if luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" }),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = 'E',
		warn = 'W',
		hint = 'H',
		info = 'I'
	}
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false, desc = "LSP mapping" }
	-- LSP actions
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
	-- Diagnostics
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = false
})

