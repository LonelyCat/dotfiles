. "$HOME/.cargo/env"

if [ -r /opt/homebrew ]
then
  ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
else
  ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/share/zsh-syntax-highlighting/highlighters
fi
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR
