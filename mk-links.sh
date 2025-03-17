#!/bin/sh

DOTFILES=$HOME/.dotfiles
CONFIG=$HOME/.config

## Global environment
##
ln -sf $DOTFILES/rcenv $HOME/.rcenv

## BASH
##
ln -sf $DOTFILES/bashrc $HOME/.bashrc
ln -sf $DOTFILES/bash_profile $HOME/.bash_profile
ln -sf $DOTFILES/bash_logout $HOME/.bash_logout

## ZSH
##
ln -sf $DOTFILES/zfunc $HOME/.zfunc
ln -sf $DOTFILES/zshrc $HOME/.zshrc

## Tools & utilities
##
ln -sf $DOTFILES/dprint.json $HOME/.dprint.json
ln -sf $DOTFILES/gitconfig $HOME/.gitconfig
ln -sf $DOTFILES/tmux.conf $HOME/.tmux.conf
ln -sf $DOTFILES/config/mc $CONFIG/mc
ln -sf $DOTFILES/config/rustfmt $CONFIG/rustfmt

## Helix editor
##
HX_CONFIG=$CONFIG/helix
mkdir -p $HX_CONFIG
case "$OSTYPE" in
  darwin*)
    OS_TYPE=darwin
  ;;
  *)
    OS_TYPE=unix
  ;;
esac
ln -sf $DOTFILES/config/helix/languages.toml.$OS_TYPE $HX_CONFIG/languages.toml
ln -sf $DOTFILES/config/helix/config.toml $HX_CONFIG/config.toml

## ZED editor
##
ZED_CONFIG=$CONFIG/zed
mkdir -p $ZED_CONFIG
ln -sf $DOTFILES/config/zed/settings.json $ZED_CONFIG/settings.json
