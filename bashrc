#
# $Version$
# $Revision$
#
# BASH startup
#

. $HOME/.rcenv

# Options
#
set -o noclobber
set -o physical

shopt -s cdspell
shopt -s extglob
shopt -s dotglob
shopt -s cmdhist
shopt -s lithist
shopt -s progcomp
shopt -s checkhash
shopt -s histreedit
shopt -s promptvars
shopt -s cdable_vars
shopt -s checkwinsize
shopt -s hostcomplete
shopt -s expand_aliases
shopt -s interactive_comments

HISTTIMEFORMAT="%d/%m/%y %T "

# Key bindings
#
bind 'TAB:menu-complete'
bind 'set show-all-if-ambiguous on'

# Completions
#
if [ ! -z "$HOMEBREW" ]
then
  if [ -r "$HOMEBREW/etc/profile.d/bash_completion.sh" ]
  then
    source "/opt/homebrew/etc/profile.d/bash_completion.sh"
  else
    if [[ -d "${HOMEBREW}/etc/bash_completion.d" ]]
    then
      for COMPLETION in "${HOMEBREW}/etc/bash_completion.d/"*
      do
        [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
      done
    fi
  fi

  if [[ -d "${HOMEBREW}/share/bash_completion" ]]
  then
    for COMPLETION in "${HOMEBREW}/sahre/bash_completion/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

if [ -f "$SHARE/bash_completion/bash_completion.sh" ]; then
  . $SHARE/bash_completion/bash_completion
fi

complete -A setopt set
complete -A user groups
complete -A binding bind
complete -A helptopic help
complete -A alias {,un}alias
complete -A signal -P '-' kill
complete -A stopped -P '%' fg bg
complete -A job -P '%' jobs disown
complete -A variable readonly unset
complete -A file -A directory ln chmod
complete -A user -A hostname finger pinky
complete -A directory find cd pushd {mk,rm}dir
complete -A file cat pico nano vi vim view emacs
complete -A file -A directory -A user chown
complete -A file -A directory -A group chgrp
complete -o default -W 'Makefile' -P '-o ' qmake
complete -A command man which whatis sudo info apropos

# Prompts
#
if [ $(id -u) -eq 0 ]; then
  rgb_usr="${rgb_red}"
else
  rgb_usr="${rgb_green}"
fi
PS1="${rgb_usr}$(whoami)${rgb_std}@$(hostname -s) \w ${rgb_usr}\\\$${rgb_restore} "

# FZF integration
#
if type fzf &>/dev/null; then
  FZF_DEFAULT_COMMAND="$FD --type f --hidden --follow --color=always -E .git --ignore-file ~/.gitignore"
  FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  FZF_DEFAULT_OPTS="--ansi"

  source <(fzf --bash)
fi

# $Id$
