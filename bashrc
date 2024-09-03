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

export HISTTIMEFORMAT="%d/%m/%y %T "

# Key bindings
#
bind 'TAB:menu-complete'
bind 'set show-all-if-ambiguous on'

# Completions
#
if [ -f "$BREW/etc/bash_completion" ]; then
    . $BREW/etc/bash_completion
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

# $Id$
