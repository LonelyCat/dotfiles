#!/bin/sh

DOT_FILES=$HOME/.dotfiles
DF_CONFIG=$DOT_FILES/config
CONFIG=$HOME/.config

## Global environment
##
ln -sf $DOT_FILES/rcenv $HOME/.rcenv

## BASH
##
ln -sf $DOT_FILES/bashrc $HOME/.bashrc
ln -sf $DOT_FILES/bash_profile $HOME/.bash_profile
ln -sf $DOT_FILES/bash_logout $HOME/.bash_logout

## ZSH
##
ln -sf $DOT_FILES/zfunc $HOME/.zfunc
ln -sf $DOT_FILES/zshrc $HOME/.zshrc

## Tools & utilities
##
ln -sf $DOT_FILES/dprint.json $HOME/.dprint.json
ln -sf $DOT_FILES/gitconfig $HOME/.gitconfig
ln -sf $DOT_FILES/tmux.conf $HOME/.tmux.conf
ln -sf $DOT_FILES/config/rustfmt $CONFIG/rustfmt

## Midnight Commander
MC_CONFIG=$CONFIG/mc
mkdir -p $MC_CONFIG
cp $DF_CONFIG/mc/ini $MC_CONFIG
cp $DF_CONFIG/mc/panels.ini $MC_CONFIG

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
ln -sf $DF_CONFIG/helix/languages.toml.$OS_TYPE $HX_CONFIG/languages.toml
ln -sf $DF_CONFIG/helix/config.toml $HX_CONFIG/config.toml

## ZED editor
##
ZED_CONFIG=$CONFIG/zed
mkdir -p $ZED_CONFIG
cp $DF_CONFIG/zed/settings.json $ZED_CONFIG/settings.json
