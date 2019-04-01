[[ -n "$PS1" ]] && [[ -f ~/.bashrc ]] && source ~/.bashrc
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
