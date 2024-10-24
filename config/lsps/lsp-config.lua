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
	config = vim.tbl_extend("force", config, {
		on_attach = function(client, bufnr)
			if client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint.enable(true)
			end
		end,
	})
	lspconfig[name].setup(config)
end

-- Setup servers
setup_server("pyright")
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
			},
		},
	},
})
setup_server("ltex")
setup_server("typst_lsp")
setup_server("texlab")
setup_server("html")
setup_server("taplo")
setup_server("jdtls")
setup_server("gopls")
setup_server("denols", {
	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})
