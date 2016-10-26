# PATH TO your oh-my-zsh installation.
export ZSH=/home/akarus/.oh-my-zsh

# Set name of the theme to load.
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

plugins=(git colored-man-pages safe-paste zsh-autosuggestions zsh-syntax-highlighting)
# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/akarus/.gem/ruby/2.3.0/bin"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor
export EDITOR='vim'

setopt NO_BEEP
setopt NO_FLOW_CONTROL
export TERM=xterm-256color

# z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# pdf
function openPdf {
    zathura $1 &
    disown
}

# feh
function openFeh {
    feh --scale-down --auto-zoom $1 &
    disown
}

#trash
function trash_put {
    trash-put $1
    set_trash
}
function sudo_trash_put {
    sudo trash-put $1
    set_trash
}

# says what package commands are in
source /usr/share/doc/pkgfile/command-not-found.zsh

# add SSH key to keychain
eval $(keychain --eval --quiet id_rsa)

# make ls colors more readable
eval "$(dircolors ~/.dircolors)";

# colored completion - use LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# aliases
alias sudo='sudo '
alias shutdown="shutdown now"

alias zshconfig="vim ~/.zshrc"
alias zshsrc="source ~/.zshrc"
alias xreload="xrdb ~/.Xresources"

alias :q="exit"
alias :Q="exit"
alias quit="exit"

alias ls="ls -lh --color=auto"
alias dirsize="df_format; echo ""; du -cksh * | sort -rh"

alias pdf="openPdf"
alias feh="openFeh"
alias ncm="ncmpcpp"
alias docprint='lpr -H ipp.doc.ic.ac.uk -U htn15 -P ICTMono'

alias v="vim"
alias vi="vim"
alias sv="sudo -E vim"

alias pasu="pacaur -Syu"
alias pas="pacaur -s"
alias paS="pacaur -S"

alias cp="rsync -ah --progress"

alias remake="make clean; make"
alias tp="trash_put"
alias stp="sudo_trash_put"
alias tl="trash-list"
alias te="trash-empty && set_trash"
alias tre="trash-restore && set_trash"
alias rm="echo 'Use: trash-put'"

alias sl="ls -lh --color=auto"
alias gs="git status"
