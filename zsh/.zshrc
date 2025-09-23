ZSH_THEME="robbyrussell"

export ZSH="$HOME/.oh-my-zsh"
export STEAM_DIR="/home/${USER}/.local/share/Steam"
export TERM='xterm-ghostty'

alias gvm='.g/bin/g'
alias aicm='go-commit --emoji'
alias oh='cd ~'
alias c='clear'
alias ls='exa --icons -bghHliS'
alias lzd='lazydocker'
alias rmpkg="sudo pacman -Rsn"
alias cleanch="sudo pacman -Scc"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias update="sudo pacman -Syu"

plugins=(
	git
	zsh-autosuggestions
    fzf
)

source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /home/tranvlnh/Projects/.env
source $ZSH/oh-my-zsh.sh

DISABLE_MAGIC_FUNCTIONS="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

[ -s "${HOME}/.g/env" ] && \. "${HOME}/.g/env"  # g shell setup

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
