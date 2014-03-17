ZSH=/usr/share/oh-my-zsh/

ZSH_THEME="frisk-red"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="false"

plugins=(git)

export EDITOR=vim
export PATH="$PATH":~/.bin

alias ls='ls --color=auto'
alias winword='playonlinux --run "Microsoft Word 2010"'

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# For coloured man pages
man() {
	env LESS_TERMCAP_mb=$'\E[01;31m' \
	LESS_TERMCAP_md=$'\E[01;38;5;74m' \
	LESS_TERMCAP_me=$'\E[0m' \
	LESS_TERMCAP_se=$'\E[0m' \
	LESS_TERMCAP_so=$'\E[38;5;246m' \
	LESS_TERMCAP_ue=$'\E[0m' \
	LESS_TERMCAP_us=$'\E[04;38;5;146m' \
	man "$@"
}

# VIM mode
NORMALMODE="%{$fg[green]%} -- [% NORMAL]%  -- %{$reset_color%}"
INSERTMODE="%{$fg[white]%} -- [% INSERT]%  -- %{$reset_color%}"
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
RPS1="${${KEYMAP/vicmd/$NORMALMODE}/(main|viins)/$INSERTMODE}"
RPS2=$RPS1
function zle-line-init zle-keymap-select {
	RPS1="${${KEYMAP/vicmd/$NORMALMODE}/(main|viins)/$INSERTMODE}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern root)

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
 
# autoload edit-command-line
# zle -N edit-command-line
# bindkey -M vicmd v edit-command-line

source /home/aish/git/opp.zsh/opp.zsh
source /home/aish/git/opp.zsh/opp/surround.zsh
source /home/aish/git/opp.zsh/opp/textobj-between.zsh
source /home/aish/git/zle_vi_visual.zsh

# inserting last output
zmodload -i zsh/parameter
insert-last-command-output() {
	LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
