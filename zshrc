ZSH=/usr/share/oh-my-zsh/

ZSH_THEME="frisk-red"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="false"

plugins=(git)

export EDITOR=vim
export PATH="$PATH":~/.bin
export JAVA_HOME=/opt/java7
_JAVA_AWT_WM_NONREPARENTING=1; export _JAVA_AWT_WM_NONREPARENTING

alias ls='ls --color=auto'
# alias winword='playonlinux --run "Microsoft Word 2010"'

source $ZSH/oh-my-zsh.sh
#source /home/aish/.zsh-autosuggestions/autosuggestions.zsh
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
NORMALMODE="%{$fg[magenta]%} -- [% NORMAL]%  -- %{$reset_color%}"
INSERTMODE="%{$fg[black]%} -- [% INSERT]%  -- %{$reset_color%}"
bindkey -v
bindkey '^P'	 up-history
bindkey '^[[5~'	 up-history
bindkey '^N'	 down-history
bindkey '^[[6~'	 down-history
bindkey '^?'	 backward-delete-char
bindkey '^[[3~'  delete-char
bindkey '^h'	 backward-delete-char
bindkey '^w'	 backward-kill-word
bindkey '^r'	 history-incremental-search-backward
bindkey '^[[1~'	 beginning-of-line
bindkey '^[[4~'	 end-of-line
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
eval "$(dircolors ~/.dirname)";

# fix grep warning
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

# npm alt packages dir to avoid root perm
NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
