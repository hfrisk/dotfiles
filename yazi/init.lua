require("full-border"):setup({ type = ui.Border.PLAIN })
require("starship"):setup({
    config_file = "~/.dots/starline.toml",
})

th.git = th.git or {}
th.git.added_sign = "+"
th.git.modified_sign = "M"
require("git"):setup()
