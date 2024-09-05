#
# $Version$
# $Revision$
#
# ZSH startup
#

# Autoloads
#

[ -d ~/.zfunc ] && fpath+=~/.zfunc
autoload -Uz colors && colors
autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit

# Common environment
#
. $HOME/.rcenv

# History settings
#
HISTFILE=~/.zsh_history
HISTCONTROL=ignoreboth
HISTFILESIZE=50
HISTSIZE=50
SAVEHIST=1000

# Options
#
setopt autocd
setopt autopushd
setopt correct
setopt histignorespace
setopt menucomplete
unsetopt nomatch
zstyle ':completion:*' menu select=1 _complete _ignored _approximate

# Key bindings
#
bindkey '^R' history-incremental-search-backward
bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search
bindkey "^[OC" forward-char
bindkey "^[OD" backward-char
bindkey "^[[3~" delete-char
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
bindkey "^?" backward-delete-char
bindkey "^[OH" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[OF" end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[F" end-of-line

#[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
#[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
#[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
#[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
#[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
#[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
#[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
#[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
#[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
#[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Prompts
#
#
if [ $(id -u) -eq 0 ]; then
  rgb_usr="%{$fg[red]%}"
else
  rgb_usr="%{$fg[green]%}"
fi
PROMPT="$rgb_usr%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%# "
RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"

# Advanced features
#
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
source $SHARE/zsh-autosuggestions/zsh-autosuggestions.zsh
source $SHARE/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
compinit

# FZF integration
#
if type fzf &>/dev/null
then
  source <(fzf --zsh)
fi

# $Id$
