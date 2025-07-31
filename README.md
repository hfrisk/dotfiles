# My dotfiles
Plus some other things.

## Configs

### Neovim

I don't have the prettiest or most fully-featured Neovim config. I almost exclusively use Neovim embedded within VS Code, through the [VSCode Neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim) plugin. With that in mind, my Neovim plugins and keybinds are mostly dedicated to speeding up keyboard navigation. 

General plugins:
* lazy.nvim
* flash.nvim
* luasnip.nvim - Mostly to separate my code snippets from VS Code itself, used in the instances where I'm using nvim through SSH or Termux.  
Standalone plugins:
VS Code plugins:

### Wezterm

My Wezterm config is purely aesthetic. No productivity boosts here.

![Screenshot of wezterm showing fastfetch.](https://i.imgur.com/NlCRrHf.png)

### Starship

My Starship config exists to have a unified, comfy cross-platform prompt. I'm not going to lie and say this makes me more productive. I just like the way it feels.

![Screenshot of wezterm showing a command prompt.](https://i.imgur.com/tdLLva3.png)

### Powershell

### VS Code

Not much to say here. It's VS Code.

## Miscellania

### Other programs I use

* zoxide
* bat
* eza

### Aliases

* `cd` -> `z`
* `cdi` -> `zi`
* `ls` -> `eza`
* `cat` -> `bat --paging=never`

### Fonts

* Cascadia Code NF
* Cascadia Mono NF

### Why not use a dotfile manager?

I found that most dotfile managers were too complicated for what should ultimately be simple and easy to migrate across different platforms. Git, symlinks, and a few short scripts are all you need. 