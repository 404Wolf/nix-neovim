local lspconfig = require("lspconfig")
local coq = require("coq")

-- Extend default configuration to add coq completions
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

setup_server("nil_ls", {
	autostart = true,
	settings = {
		["nil"] = { testSetting = 42 },
	},
})

setup_server("yamlls", {
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["https://json.schemastore.org/github-action.json"] = "/.github/actions/*",
				["https://json.schemastore.org/docker-compose.json"] = "/*compose",
				["https://json.schemastore.org/prettierrc.json"] = "/.prettierrc",
				["https://json.schemastore.org/kubernetes.json"] = "/*.k8s.yaml",
			},
		},
	},
})

setup_server("lemminx", {
	settings = {
		xml = {
			validation = {
				enabled = true,
				schema = true,
			},
			completion = {
				autoCloseTags = true,
			},
			format = {
				enabled = true,
				splitAttributes = true,
			},
		},
	},
})
vim.filetype.add({
	extension = {
		xml = "xml",
		ant = "xml",
	},
})

setup_server("tinymist", { single_file_support = true, offset_encoding = "utf-8" })

setup_server("pyright", {
	vim.lsp.inlay_hint.enable(true),
})

setup_server("gopls", {
	vim.lsp.inlay_hint.enable(true),
})

setup_server("ltex")
setup_server("texlab")
setup_server("html")
setup_server("taplo")
setup_server("jdtls")
setup_server("nushell")
setup_server("bashls")
setup_server("jsonls")
setup_server("jsonls")
setup_server("racket_langserver")
setup_server("lemminx")
setup_server("sourcekit", { filetype = { "swift" } })

local function is_deno_project()
	return lspconfig.util.root_pattern("deno.json", "deno.jsonc")(vim.fn.getcwd()) ~= nil
end

-- Deno Language Server
setup_server("denols", {
	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
	settings = {
		deno = {
			enable = is_deno_project(),
		},
	},
	on_attach = function(_, _)
		vim.lsp.inlay_hint.enable(true)
	end,
})

-- For TypeScript/JavaScript, use typescript-tools instead of tsserver
setup_server("typescript-tools", {
	on_attach = function(_, _)
		vim.lsp.inlay_hint.enable(true)
	end,
	opts = {
		root_dir = lspconfig.util.root_pattern("package.json"),
	},
	settings = {
		-- TypeScript tools specific settings
		separate_diagnostic_server = true,
		publish_diagnostic_on = "insert_leave",
		tsserver_file_preferences = {
			includeInlayParameterNameHints = "all",
			includeCompletionsForModuleExports = true,
		},
	},
})

-- Eslint Language Server
setup_server("eslint", {
	settings = {
		eslint = { enable = not is_deno_project() },
	},
})

-- Haskell Language Server
setup_server("hls", {
	filetypes = { "haskell", "lhaskell", "cabal" },
})

setup_server("biome")
