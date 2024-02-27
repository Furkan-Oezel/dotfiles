# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=10000000
SAVEHIST=10000000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/furkan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#=================#
# custom settings #
#=================#
# reverse search
bindkey '^R' history-incremental-search-backward

# highlight on tab
zstyle ':completion:*' menu select

# include hidden files on tab
setopt globdots

# prompt
prompt='%B%F{blue}⟨%f%n%F{blue}∆%fshell%F{blue}⟩——%f%F{blue}⟨%f%~%F{blue}⟩%f %F{blue}⟩⟩⟩%f%b '
# prompt='😂 '
# %B = start (stop) boldface mode
# %F = start (stop) color mode; blue = 128,0,255 ??
# %n = username
# %m = hostname
# %~ = current working directory, $HOME is replaced with '~'

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# This tells zsh that small letters will match small and capital letters.
# (i.e. capital letters match only capital letters.)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# to use go in every directory.
export PATH=$PATH:/usr/local/go/bin
