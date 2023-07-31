local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Sntup language servers.
local lspconfig = require("lspconfig")
local clangd_nvim = require("clangd_nvim")
local cmp = require("cmp")

-- WARNING: Confir of lang servers

lspconfig.gopls.setup({
	capabilities = capabilities,
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

lspconfig.fortls.setup({
	capabilities = capabilities,
	filetypes = { "f90", "f95", "f03", "f08", "f18", "fortran" },
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
})

lspconfig.zls.setup({
	capabilities = capabilities,
	cmd = { "zls" },
})

lspconfig.fortls.setup({
	capabilities = capabilities,
})
lspconfig.bashls.setup({
	capabilities = capabilities,
})
lspconfig.cmake.setup({
	capabilities = capabilities,
})
lspconfig.pyright.setup({
	capabilities = capabilities,
})
lspconfig.tsserver.setup({
	capabilities = capabilities,
})
lspconfig.prismals.setup({
	capabilities = capabilities,
})
lspconfig.cssls.setup({
	capabilities = capabilities,
})
lspconfig.clangd.setup({
	capabilities = {
		textDocument = {
			semanticHighlightingCapabilities = {
				semanticHighlighting = true,
			},
		},
	},
	on_init = clangd_nvim.on_init,
})

lspconfig.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = true,
				experimental = {
					enable = true,
				},
			},
		},
	},
})

-- WARNING: Confir of lang servers

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>lD", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>ld", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		-- vim.keymap
		--     .set('n', '<Leader>sa', vim.lsp.buf.add_workspace_folder, opts)
		-- vim.keymap.set('n', '<Leader>sr', vim.lsp.buf.remove_workspace_folder,
		--                opts)
		-- vim.keymap.set('n', '<Leader>sl', function()
		--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- end, opts)
		-- vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, opts)
		-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<Leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
