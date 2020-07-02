export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME='arrow'

export UPDATE_ZSH_DAYS=2
export PATH=$PATH:$HOME/chrd # Chromedriver
export PATH=$PATH:$HOME/anaconda3/bin # Anaconda binaries
export PATH=$PATH:$HOME/flutter/bin # Flutter binaries
export PATH=$PATH:$HOME/.pub-cache/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/platform-tools # ADB and Fastboot tools
export PATH=$PATH:$HOME/.emacs.d/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/usr/local/sbin

export PKG_CONFIG_PATH=/usr/local/Cellar/zlib/1.2.8/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig

ENABLE_CORRECTION="true"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim

alias ..="cd .."
alias config='/usr/bin/git --git-dir=$HOME/.m8cfg/ --work-tree=$HOME'
alias configignore='config config --local status.showUntrackedFiles no'

function configBackup() {
	cd
	config commit -a -m "Autopush"
	config push -u origin master
}

function ccpp() {
	clang++ -std=c++17 -O2 -g -o out -D M8_LOCAL -fsanitize=address -fsanitize=bounds -fno-sanitize-recover=all -fstack-protector -fsanitize=undefined $1
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