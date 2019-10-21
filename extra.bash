# Set environment for processes
export SHELL_NAME=${SHELL##*/}

# Enable color in command line and 'less'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

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
[[ -d ${HOME}/go ]] && export GOPATH=${GOPATH:=$HOME/go}


# Python virtual environments
[[ -d ${HOME}/.venv ]] && export WORKON_HOME=${HOME}/.venv
[[ -d ${HOME}/devel ]] && export PROJECT_HOME=${HOME}/devel
python_version=$(python -V | awk '{print $2}')
python_major_version=$(echo "${python_version}" | cut -d'.' -f1,2)
[[ -d ${HOME}/.pyenv/versions/${python_version}/lib/python${python_major_version}/site-packages ]] && export PYTHONPATH=${PYTHONPATH}:${HOME}/.pyenv/versions/${python_version}/lib/python${python_major_version}/site-packages

# Link Brew Cask applications to normal location
if which brew &>/dev/null; then  export HOMEBREW_CASK_OPTS="--appdir=/Applications"; fi

## TAB completion
# Load Ruby's rbenv
if which rbenv &>/dev/null; then  eval "$(rbenv init -)"; fi

# Load Pipenv autocompletion
if which pipenv &>/dev/null; then  eval "$(pipenv --completion)"; fi

# Load nodenv
if which nodenv &>/dev/null; then  eval "$(nodenv init -)"; fi

if [[ "${SHELL_NAME}" == "bash" ]]; then
  export BASH_COMPLETION_COMPAT_DIR=/usr/local/etc/bash_completion.d

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

  # Enable git tab completion
  [[ -f ${BASH_COMPLETION_COMPAT_DIR}/git-completion.bash ]] && . ${BASH_COMPLETION_COMPAT_DIR}/git-completion.bash

  # Add tab completion for `defaults read|write NSGlobalDomain`
  # You could just use `-g` instead, but I like being explicit
  complete -W "NSGlobalDomain" defaults;

  # AWS shell command completion
  [[ -f /usr/local/bin/aws_completer ]] && complete -C '/usr/local/bin/aws_completer' aws
  [[ -f ${HOME}/.local/bin/aws_completer ]] && complete -C "${HOME}/.local/bin/aws_completer" aws

  # SSH hostnames
  [[ -f ${BASH_COMPLETION_COMPAT_DIR}/ssh ]] && . ${BASH_COMPLETION_COMPAT_DIR}/ssh &>/dev/null

  # Add Okta AWS CLI plugin
  [[ -f ${HOME}/.okta/bash_functions ]] && source ${HOME}/.okta/bash_functions
elif [[ "${SHELL_NAME}" == "zsh" ]]; then
  ## zsh
  # AWS shell command completion
  [[ -f /usr/local/bin/aws_zsh_completer.sh ]] && . /usr/local/bin/aws_zsh_completer.sh &>/dev/null

  # SSH hostnames
  [[ -f /usr/local/share/zsh-completions/_ssh ]] && . /usr/local/share/zsh-completions/_ssh
fi

# direnv execution
if which direnv &> /dev/null; then  eval "$(direnv hook ${SHELL_NAME})"; fi

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

