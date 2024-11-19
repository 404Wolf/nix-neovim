local lspconfig = require("lspconfig")
local coq = require("coq")

-- Extend default configuration
lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
	capabilities = vim.tbl_deep_extend(
		"force",
		vim.lsp.protocol.make_client_capabilities(),
		coq.lsp_ensure_capabilities()
	),
})

-- Function to setup servers with coq capabilities and autostart
local function setup_server(name, config)
	config = config or { autostart = true }
	lspconfig[name].setup(config)
end

-- Setup servers
setup_server("pyright", {
	vim.lsp.inlay_hint.enable(true),
})
setup_server("lua_ls", {
	autostart = true,
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if not (vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc")) then
			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = { version = "LuaJIT" },
				workspace = {
					checkThirdParty = false,
					library = { vim.env.VIMRUNTIME },
				},
			})
		end
	end,
	settings = { Lua = {} },
})
setup_server("rust_analyzer")

require("lspconfig").nil_ls.setup({
	autostart = true,
	settings = {
		["nil"] = { testSetting = 42 },
	},
})

setup_server("bashls")
setup_server("jsonls")
setup_server("yamlls", {
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["https://json.schemastore.org/github-action.json"] = "/.github/actions/*",
				["https://json.schemastore.org/prettierrc.json"] = "/.prettierrc",
				["https://json.schemastore.org/kubernetes.json"] = "/*.k8s.yaml",
			},
		},
	},
})
setup_server("ltex")
setup_server("tinymist", { single_file_support = true, offset_encoding = "utf-8" })
setup_server("texlab")
setup_server("html")
setup_server("taplo")
setup_server("jdtls")
setup_server("gopls", {
	vim.lsp.inlay_hint.enable(true),
})
setup_server("denols", {
	on_attach = on_attach,
	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
	vim.lsp.inlay_hint.enable(true),
})

-- setup_server("ts_ls", {
-- 	on_attach = on_attach,
-- 	root_dir = lspconfig.util.root_pattern("package.json"),
-- 	single_file_support = truet,
-- 	vim.lsp.inlay_hint.enable(true),
-- })
