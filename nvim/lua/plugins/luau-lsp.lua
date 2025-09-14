return {
    "lopi-py/luau-lsp.nvim",
    event = "LazyFile",
    opts = {
        platform = {
            type = "roblox",
        },
        types = {
            roblox_security_level = "PluginSecurity",
        },
        sourcemap = {
            enabled = true,
            autogenerate = true,
            rojo_project_file = "default.project.json",
            sourcemap_file = "sourcemap.json",
        },
    },
    dependencies = {
        "ahmedkhalf/project.nvim", --ensure luau-lsp.nvim loads after project.nvim
        "nvim-lua/plenary.nvim",
    },
}
