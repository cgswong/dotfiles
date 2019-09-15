[[ -n "$PS1" ]] && [[ -f ~/.bashrc ]] && source ~/.bashrc
source ~/.bash_prompt
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

[[ -s "${HOME}/.iterm2_shell_integration.bash" ]] && source "${HOME}/.iterm2_shell_integration.bash"

