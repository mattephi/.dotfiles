# NOTE: make sure your terminal session starts as login-shell
# this is important for .zlogin and .zlogout

export ZSH="$HOME/.oh-my-zsh"
DISABLE_AUTO_UPDATE="true"

ZSH_THEME='arrow'

export UPDATE_ZSH_DAYS=7
export PATH=$PATH:$HOME/anaconda3/bin # Anaconda binaries
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:$HOME/tools/cmake/bin

ENABLE_CORRECTION="true"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim

alias ..="cd .."
alias psql="/Library/PostgreSQL/13/scripts/runpsql.sh; exit"
alias config='/usr/bin/git --git-dir=$HOME/.m8cfg/ --work-tree=$HOME'
alias configignore='config config --local status.showUntrackedFiles no'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias nvide='neovide'

function configBackup() {
	cd
	config commit -a -m "Autopush"
	config push -u origin master
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/m8dotpie/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/m8dotpie/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/m8dotpie/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/m8dotpie/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
#[ -f "/Users/m8dotpie/.ghcup/env" ] && source "/Users/m8dotpie/.ghcup/env" # ghcup-env
export PATH="/usr/local/opt/llvm/bin:$PATH"
[ -f "/Users/m8dotpie/.ghcup/env" ] && source "/Users/m8dotpie/.ghcup/env" # ghcup-env

eval $(thefuck --alias)
