local lspconfig = require("lspconfig")
local coq = require("coq")

-- Extend default configuration
lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
	capabilities = vim.tbl_deep_extend(
		"force",
		vim.lsp.protocol.make_client_capabilities(),
		coq.lsp_ensure_capabilities(),
		require("lsp-file-operations").default_capabilities()
	),
})

-- Function to setup servers with coq capabilities and autostart
local function setup_server(name, config)
	config = config or { autostart = true }
	lspconfig[name].setup(config)
end

-- Create a capabilities table with everything disabled
local function create_minimal_capabilities()
	local minimal_capabilities = vim.lsp.protocol.make_client_capabilities()
	for capability, value in pairs(minimal_capabilities) do
		if type(value) == "table" then
			for subcapability in pairs(value) do
				minimal_capabilities[capability][subcapability] = false
			end
		else
			minimal_capabilities[capability] = false
		end
	end
	return minimal_capabilities
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

local nixd_capabilities = create_minimal_capabilities()
-- Enable only symbol-related capabilities
nixd_capabilities.textDocument.documentSymbol = {
	dynamicRegistration = true,
	symbolKind = {
		valueSet = vim.tbl_values(vim.lsp.protocol.SymbolKind),
	},
	hierarchicalDocumentSymbolSupport = true,
}
nixd_capabilities.workspace.symbol = {
	dynamicRegistration = true,
	symbolKind = {
		valueSet = vim.tbl_values(vim.lsp.protocol.SymbolKind),
	},
}

-- Setup nixd with limited capabilities
lspconfig.nixd.setup({
	capabilities = nixd_capabilities,
	settings = {
		nixd = {
			options = {
				enable = true,
				target = {
					symbol = true,
					diagnostics = false,
					completion = false,
					formatting = false,
				},
			},
		},
	},
})

-- Setup other servers
setup_server("nil_ls")
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
setup_server("texlab")
setup_server("html", { capabilities = capabilities })
setup_server("taplo", { capabilities = capabilities })
setup_server("jdtls")
