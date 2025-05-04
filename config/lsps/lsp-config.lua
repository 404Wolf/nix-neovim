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
        offset_encoding = "utf-8" 
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
        filetype = { "swift" } 
    },
    
    denols = {
        root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
        single_file_support = false,
        on_attach = function(_, _)
            vim.lsp.inlay_hint.enable(true)
        end,
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
require("typescript-tools").setup({
	on_attach = function(_, _)
		vim.lsp.inlay_hint.enable(true)
	end,
	root_dir = lspconfig.util.root_pattern({ "package.json", "tsconfig.json" }),
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
