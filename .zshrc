export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME='arrow'

export UPDATE_ZSH_DAYS=2
export PATH=$PATH:~/chrd # Chromedriver
export PATH=$PATH:~/anaconda3/bin # Anaconda binaries
export PATH=$PATH:~/flutter/bin # Flutter binaries
export PATH=$PATH:~/.pub-cache/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/platform-tools # ADB and Fastboot tools
export PATH=$PATH:~/.emacs.d/bin
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
export CFGBCKP="/Users/m8dotpie/Desktop/MSB"

alias ..="cd .."
alias ncfg="nvim ~/.config/nvim/init.vim"
alias zcfg="nvim ~/.zshrc"
alias gitbackup="autoBackupSettings"
alias config='/usr/bin/git --git-dir=$HOME/.m8cfg/ --work-tree=$HOME'
alias configignore='config config --local status.showUntrackedFiles no'

function autoBackupSettings() {
	cp ~/.zlogin $CFGBCKP/ZSH
	cp ~/.zlogout $CFGBCKP/ZSH
	cp ~/.zshrc $CFGBCKP/ZSH
	cp ~/.config/nvim/init.vim $CFGBCKP/NVIM
	git -C $CFGBCKP add .
	git -C $CFGBCKP commit -m auto-update
	git -C $CFGBCKP push
}

function preview () {
	open -a Preview $1
}

function compilecpp() {
	clang++ -std=c++17 -O2 -g -o out -D M8_LOCAL -fsanitize=address -fsanitize=bounds -fno-sanitize-recover=all -fstack-protector -fsanitize=undefined $1
}

function mkcpp() {
	cp $CFGBCKP/CPP/cpptemplate.cpp $1
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
