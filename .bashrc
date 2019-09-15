# Bash-it
if [[ -d "${HOME}/.bash_it" ]]; then
  export BASH_IT=${HOME}/.bash_it
  export BASH_IT_CUSTOM=${HOME}/dotfiles
  export BASH_IT_THEME="bobby"
  export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

  # Load Bash It
  [[ -s "${BASH_IT}/bash_it.sh" ]] && source "${BASH_IT}/bash_it.sh"
else
  # Load the shell dotfiles
  for fname in "${HOME}/.{path,aliases,functions,extra}"; do
    [[ -s "$fname" ]] && source "$fname"
  done
  unset fname
fi
unset MAILCHECK

# Load nvm bash_completion
[[ -d "${HOME}/.nvm" ]] && export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[ "$BASH_VERSION" ] && npm() {
  # hack: avoid slow npm sanity check in nvm
  if [[ "$*" == "config get prefix" ]]; then
    which node | sed "s/bin\/node//"
  else
    $(which npm) "$@"
  fi
}
# prevent rvm complaints that nvm is first in PATH
rvm_silence_path_mismatch_check_flag=1
unset npm
# end hack
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
