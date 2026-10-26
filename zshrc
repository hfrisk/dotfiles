#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# autoload -U colors
#colors


## functions + aliases
# mkdir + cd into it
function mkcd() {
	mkdir $* && cd $_
}

# cd to root of git repo
alias cdr='cd $(git rev-parse --show-toplevel)'

# https://gist.github.com/AppleBoiy/04a249b6f64fd0fe1744aff759a0563b
#ls style eza
alias ls='eza --group-directories-first --icons=auto --color=auto'
alias fzf='fzf --popup'
alias fd="fd -H"

# vars
HISTFILE=~/.zsh_history
export SSH_AUTH_SOCK=~/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim


eval "$(zoxide init zsh --cmd cd)"

# starship
eval "$(starship init zsh)"

ZELLIJ_AUTO_ATTACH=true
ZELLIJ_AUTO_EXIT=true
# eval "$(zellij setup --generate-auto-start zsh)"
ZJ_SESSIONS=$(zellij list-sessions -ns)
NO_SESSIONS=$(echo "${ZJ_SESSIONS}" | wc -l)


## if [[ -z "$ZELLIJ" ]]; then
    #if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
       #if [ "${NO_SESSIONS}" -ge 2 ]; then
            #zellij attach \
            #"$(echo "${ZJ_SESSIONS}" | sk)"
        #else
            #zellij attach -c
        #fi
    #else
        #zellij
    #fi

    #if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
       #exit
    #fi
#fi
eval "$(atuin init zsh)"
fastfetch
