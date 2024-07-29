local lspconfig = require("lspconfig")
local coq = require("coq")

-- Extend default configuration
lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
	capabilities = vim.tbl_deep_extend(
		"force",
		vim.lsp.protocol.make_client_capabilities(),
		vim.lsp.protocol.make_client_capabilities(),
		require("lsp-file-operations").default_capabilities()
	),
})

-- Common capabilities configuration
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local coq_capabilities = coq.lsp_ensure_capabilities({ capabilities = capabilities })

-- Function to setup servers with coq capabilities and autostart
local function setup_server(name, config, settings)
	config = config or { autostart = true }
	lspconfig[name].setup(vim.tbl_extend("force", coq_capabilities, config))
end
--
-- Create a capabilities table with everything disabled
local function create_minimal_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	for capability, _ in pairs(capabilities) do
		if type(capabilities[capability]) == "table" then
			for subcapability, _ in pairs(capabilities[capability]) do
				capabilities[capability][subcapability] = false
			end
		else
			capabilities[capability] = false
		end
	end
	return capabilities
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

-- I like nixd's symbol tree offers. I don't like the LSP for anything else.
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
