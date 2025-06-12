ZSH_THEME="robbyrussell"

export ZSH="$HOME/.oh-my-zsh"

alias aicm='go-commit --emoji'
alias oh='cd ~'
alias cls='clear'
alias yazi='flatpak run io.github.sxyazi.yazi'
alias zen='bash <(curl https://updates.zen-browser.app/appimage.sh)'
alias els='exa --icons -bghHliS'
alias wezterm='flatpak run org.wezfurlong.wezterm'
alias lzd='lazydocker'
alias lzg='lazygit'

[[ -s "/home/tranvlnh/.gvm/scripts/gvm" ]] && source "/home/tranvlnh/.gvm/scripts/gvm"
. "$HOME/.local/bin/env"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-bat
)

source /home/tranvlnh/Projects/.env
source /home/tranvlnh/.local/bin
source $ZSH/oh-my-zsh.sh
