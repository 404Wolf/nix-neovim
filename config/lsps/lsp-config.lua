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

local function first_config_type(startpath)
	local path = lspconfig.util.path
	startpath = lspconfig.util.strip_archive_subpath(startpath)

	-- Track which config type we found
	local found_type = nil

	-- Function that checks for config files at a specific directory
	local check_dir = function(dir)
		-- Check for Deno config first
		if vim.loop.fs_stat(path.join(dir, "deno.json")) or vim.loop.fs_stat(path.join(dir, "deno.jsonc")) then
			found_type = "deno"
			return dir
		end

		-- Then check for TypeScript config
		if vim.loop.fs_stat(path.join(dir, "package.json")) or vim.loop.fs_stat(path.join(dir, "tsconfig.json")) then
			found_type = "typescript"
			return dir
		end

		-- No config found at this level
		return nil
	end

	-- Search up the directory tree
	local dir = lspconfig.util.search_ancestors(startpath, check_dir)

	-- Return both the directory and the type of config found
	return dir, found_type
end

-- Create specific root detectors for each LSP
local function deno_root_dir(startpath)
	local dir, config_type = first_config_type(startpath)
	return config_type == "deno" and dir or nil
end

local function typescript_root_dir(startpath)
	local dir, config_type = first_config_type(startpath)
	return config_type == "typescript" and dir or nil
end

lspconfig.denols.setup({
	root_dir = function(startpath)
		local dir = vim.fn.fnamemodify(startpath, ":h")

    -- It is a deno project if there's a deno.json in the cwd
		if vim.loop.fs_stat(dir .. "/deno.json") or vim.loop.fs_stat(dir .. "/deno.jsonc") then
			return dir
		end

		-- Not a Deno project
		return nil
	end,
	single_file_support = false,
	on_attach = function(_, _)
		vim.lsp.inlay_hint.enable(true)
	end,
})

require("typescript-tools").setup({
	on_attach = function(_, _)
		vim.lsp.inlay_hint.enable(true)
	end,
	root_dir = function(startpath)
		local dir = vim.fn.fnamemodify(startpath, ":h")

    -- It is a deno project if there's a deno.json in the cwd
		if vim.loop.fs_stat(dir .. "/deno.json") or vim.loop.fs_stat(dir .. "/deno.jsonc") then
			return nil
		end

		if vim.loop.fs_stat(dir .. "/package.json") or vim.loop.fs_stat(dir .. "/tsconfig.json") then
			return dir
		end

		return nil
	end,
	single_file_support = false,
	settings = {
		root_dir = lspconfig.util.root_pattern({ "package.json", "tsconfig.json" }),
		single_file_support = false,
		separate_diagnostic_server = true,
		publish_diagnostic_on = "insert_leave",
		tsserver_file_preferences = {
			includeInlayParameterNameHints = "all",
			includeCompletionsForModuleExports = true,
		},
	},
})
