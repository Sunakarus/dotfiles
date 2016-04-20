# PATH TO your oh-my-zsh installation.
export ZSH=/home/akarus/.oh-my-zsh

# Set name of the theme to load.
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

plugins=(git colored-man-pages safe-paste zsh-autosuggestions zsh-syntax-highlighting)
# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
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

# says what package commands are in
source /usr/share/doc/pkgfile/command-not-found.zsh

# add SSH key to keychain
eval $(keychain --eval --quiet id_rsa)

# make ls colors more readable
eval "$(dircolors ~/.dircolors)";

# colored completion - use LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# aliases
alias zshconfig="vim ~/.zshrc"
alias zshsrc="source ~/.zshrc"
alias :q="exit"
alias quit="exit"
alias pdf="openPdf"
alias v="vim"
alias vi="vim"
alias ls="ls -lh --color=auto"
alias svim="sudo -E vim"
alias sv="sudo -E vim"
alias xreload="xrdb ~/.Xresources"
alias shutdown="shutdown now"
alias docprint='lpr -H ipp.doc.ic.ac.uk -U htn15 -P ICTMono'
alias feh="openFeh"
alias yasu="yaourt -Syu --aur"
alias ys="yaourt -S"
alias ncm="ncmpcpp"
alias dirsize="df_format; echo ""; du -cksh * | sort -rh"
alias cp="rsync -ah --progress"
alias sucp="sudo rsync -ah --progress"
