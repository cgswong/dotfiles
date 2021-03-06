# Set environment for processes
export SHELL_NAME=${SHELL##*/}

# Enable color in command line and 'less'
# export LSCOLORS=GxFxCxDxBxegedabagaced
export CLICOLOR=1
export CLICOLOR_FORCE=1

# Set default text editor
export EDITOR=vim

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

## AWS
# Set environment for AWS access
export AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION:-"us-east-1"}
export AWS_CREDENTIAL_FILE="${HOME}/.aws/credentials"

# Kubernetes
[[ -f "${HOME}/.kube/config" ]] && export KUBECONFIG=${KUBECONFIG:=$HOME/.kube/config}

## Programming paths
# Go environment
[[ -d ${HOME}/devel/go ]] && export GOPATH=${GOPATH:=$HOME/devel/go}

# Python virtual environments
[[ -d ${HOME}/.venv ]] && export WORKON_HOME=${HOME}/.venv
[[ -d ${HOME}/devel ]] && export PROJECT_HOME=${HOME}/devel

# Link Brew Cask applications to normal location
command -V brew &>/dev/null && export HOMEBREW_CASK_OPTS="--appdir=/Applications"

## TAB completion
# Load Ruby's rbenv
command -V rbenv &>/dev/null && eval "$(rbenv init -)"

# Load Pipenv autocompletion
command -V pipenv &>/dev/null &&  eval "$(pipenv --completion)"

if [[ "${SHELL_NAME}" == "bash" ]]; then
  # Enable some Bash 4 features when possible:
  # autocd: e.g. `**/qux` will enter `./foo/bar/baz/qux`
  # cdspell: Autocorrect typos in path names when using `cd`
  # globstar: Recursive globbing, e.g. `echo **/*.txt`
  # histappend: Append to the Bash history file, rather than overwriting it
  # nocaseglob: Case-insensitive globbing (used in pathname expansion)
  for option in autocd cdspell globstar histappend nocaseglob; do
    shopt -s "$option" 2>/dev/null
  done;

  # Brewed Bash command tab completion
  if [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
    . "/usr/local/etc/profile.d/bash_completion.sh"
  elif [[ -r /etc/bash_completion ]]; then
    . /etc/bash_completion
  fi

  # Add tab completion for `defaults read|write NSGlobalDomain`
  # You could just use `-g` instead, but I like being explicit
  complete -W "NSGlobalDomain" defaults;

  # AWS shell command completion
  if [[ -f /usr/local/bin/aws_completer ]]; then
    complete -C '/usr/local/bin/aws_completer' aws
  elif [[ -f ${HOME}/.local/bin/aws_completer ]]; then
    complete -C "${HOME}/.local/bin/aws_completer" aws
  fi

  # SSH hostnames
  [[ -f ${BASH_COMPLETION_COMPAT_DIR}/ssh ]] && . ${BASH_COMPLETION_COMPAT_DIR}/ssh &>/dev/null

  # Add Okta AWS CLI plugin
  [[ -f ${HOME}/.okta/bash_functions ]] && source ${HOME}/.okta/bash_functions

  # Add OpenSSL flags for compiling to work
  if [[ -d "/usr/local/opt/openssl@1.1" ]]; then
    export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
    export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
    export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
  fi

  # Enable pyenv if installed
  if command -v pyenv &>/dev/null; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
  fi
elif [[ "${SHELL_NAME}" == "zsh" ]]; then
  ## zsh
  # AWS shell command completion
  [[ -f /usr/local/bin/aws_zsh_completer.sh ]] && . /usr/local/bin/aws_zsh_completer.sh &>/dev/null

  # SSH hostnames
  [[ -f /usr/local/share/zsh-completions/_ssh ]] && . /usr/local/share/zsh-completions/_ssh
fi

# direnv execution
command -V direnv &>/dev/null && eval "$(direnv hook ${SHELL_NAME})"

# Google Cloud shell command completion
[[ -f ${HOME}/gcloud/google-cloud-sdk/path.${SHELL_NAME}.inc ]] && . ${HOME}/gcloud/google-cloud-sdk/path.${SHELL_NAME}.inc &>/dev/null
[[ -f ${HOME}/gcloud/google-cloud-sdk/completion.${SHELL_NAME}.inc ]] && . ${HOME}/gcloud/google-cloud-sdk/completion.${SHELL_NAME}.inc &>/dev/null

# Travis
[[ -f ${HOME}/.travis/travis.sh ]] && source ${HOME}/.travis/travis.sh

# GNU manpages for programs that are from GNU coreutils
[[ -d /usr/local/opt/coreutils/libexec/gnuman ]] && export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"

## Serverless
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/carrwong/node_modules/tabtab/.completions/serverless.${SHELL_NAME} ] && . /Users/carrwong/node_modules/tabtab/.completions/serverless.${SHELL_NAME}
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/carrwong/node_modules/tabtab/.completions/sls.${SHELL_NAME} ] && . /Users/carrwong/node_modules/tabtab/.completions/sls.${SHELL_NAME}
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/carrwong/node_modules/tabtab/.completions/slss.${SHELL_NAME} ] && . /Users/carrwong/node_modules/tabtab/.completions/slss.${SHELL_NAME}

# NVM Configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
