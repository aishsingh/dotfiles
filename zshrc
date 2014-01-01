# Path to your oh-my-zsh configuration.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="aish" #"pygmalion" #"agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13
export EDITOR=vim
export TERM=xterm-256color
# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git dirnavigate)


source $ZSH/oh-my-zsh.sh

#enable vim mode on commmand line
#bindkey -v
#RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
# no delay entering normal mode
# https://coderwall.com/p/h63etq
# https://github.com/pda/dotzsh/blob/master/keyboard.zsh#L10
# 10ms for key sequences
#KEYTIMEOUT=1
# show vim status
# http://zshwiki.org/home/examples/zlewidgets
#function zle-line-init zle-keymap-select {
#    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#    RPS2=$RPS1
#    zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select
# add missing vim hotkeys
# fixes backspace deletion issues
# http://zshwiki.org/home/zle/vi-mode
#bindkey -a u undo
#bindkey -a '^R' redo
# history search in vim mode
# http://zshwiki.org./home/zle/bindkeys#why_isn_t_control-r_working_anymore
#Use vim cli mode
#bindkey '^P' up-history
#bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
#bindkey '^?' backward-delete-char
#bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
#bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
#bindkey '^r' history-incremental-search-backward
