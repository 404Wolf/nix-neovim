local lspconfig = require("lspconfig")
local coq = require("coq")

lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
	capabilities = vim.tbl_deep_extend(
		"force",
		vim.lsp.protocol.make_client_capabilities(),
		coq.lsp_ensure_capabilities()
	),
})

local servers = {
	lua_ls = {
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
	},

	nil_ls = {
		autostart = true,
		settings = {
			["nil"] = { testSetting = 42 },
		},
	},

	yamlls = {
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
	},

	lemminx = {
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
	},

	tinymist = {
		single_file_support = true,
		offset_encoding = "utf-8",
	},

	pyright = {
		on_attach = function(_, _)
			vim.lsp.inlay_hint.enable(true)
		end,
	},

	gopls = {
		on_attach = function(_, _)
			vim.lsp.inlay_hint.enable(true)
		end,
	},

	ltex = {},
	texlab = {},
	html = {},
	taplo = {},
	jdtls = {},
	nushell = {},
	bashls = {},
	jsonls = {},
	racket_langserver = {},

	sourcekit = {
		filetype = { "swift" },
	},

	eslint = {
		settings = {
			eslint = { enable = lspconfig.util.root_pattern("package.json") },
		},
	},

	hls = {
		filetypes = { "haskell", "lhaskell", "cabal" },
	},

	biome = {},

	denols = {
		root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
		init_options = {
			lint = true,
			unstable = true,
			suggest = {
				imports = { hosts = { ["https://deno.land"] = true } },
			},
		},
		single_file_support = false,
	},

	vtsls = {
		root_dir = function(filename)
			local denoRootDir = lspconfig.util.root_pattern("deno.json", "deno.json")(filename)
			if denoRootDir then
				return nil
			end

			return lspconfig.util.root_pattern("package.json")(filename)
		end,
		single_file_support = false,
	},
}

for server, config in pairs(servers) do
	config.autostart = config.autostart ~= false
	lspconfig[server].setup(config)
end

vim.filetype.add({
	extension = {
		xml = "xml",
		ant = "xml",
	},
})
