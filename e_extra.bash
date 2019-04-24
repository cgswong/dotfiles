# Set environment for processes
SHELL_NAME=${SHELL##*/}

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
export AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION:-"us-east-2"}
export AWS_CREDENTIAL_FILE="${HOME}/.aws/credentials"

# Kubernetes
[[ -f "${HOME}/.kube/config" ]] && export KUBECONFIG=${KUBECONFIG:=$HOME/.kube/config}

## Programming paths
# Go environment
[[ -d ${HOME}/go ]] && export GOPATH=${GOPATH:=$HOME/go}


# Python virtual environments
[[ -d ${HOME}/.venv ]] && export WORKON_HOME=${HOME}/.venv
[[ -d ${HOME}/devel ]] && export PROJECT_HOME=${HOME}/devel

# Link Brew Cask applications to normal location
if which brew &>/dev/null; then  export HOMEBREW_CASK_OPTS="--appdir=/Applications"; fi

## TAB completion
# Load Ruby's rbenv
if which rbenv &>/dev/null; then  eval "$(rbenv init -)"; fi

# Load Pipenv autocompletion
if which pipenv &>/dev/null; then  eval "$(pipenv --completion)"; fi

# Load nodenv
if which nodenv &>/dev/null; then  eval "$(nodenv init -)"; fi

if [[ "${SHELL}" == *"bash" ]]; then
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
  if which brew &>/dev/null && [[ -f "/usr/local/etc/bash_completion" ]]; then
    source "/usr/local/etc/bash_completion"
  elif [[ -f /etc/bash_completion ]]; then
    source /etc/bash_completion
  fi

  # Enable tab completion for `g` by marking it as an alias for `git`
  if type _git &>/dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    complete -o default -o nospace -F _git g
  fi

  # Add tab completion for `defaults read|write NSGlobalDomain`
  # You could just use `-g` instead, but I like being explicit
  complete -W "NSGlobalDomain" defaults;

  # AWS shell command completion
  [[ -f /usr/local/bin/aws_completer ]] && complete -C '/usr/local/bin/aws_completer' aws

  # kubectl completion. Must have 4.4+ version of bash to work
  #if which kubectl &>/dev/null; then  "source <(kubectl completion bash)"; fi

  # direnv execution
  if which direnv &> /dev/null; then  eval "$(direnv hook bash)"; fi

  # SSH hostnames
  [[ -f /usr/local/etc/bash_completion.d/ssh_hosts ]] && source /usr/local/etc/bash_completion.d/ssh_hosts &>/dev/null
elif [[ "${SHELL}" == *"zsh" ]]; then
  ## zsh
  # AWS shell command completion
  [[ -f /usr/local/bin/aws_zsh_completer.sh ]] && source /usr/local/bin/aws_zsh_completer.sh &>/dev/null

  # kubectl completion
  #if which kubectl &>/dev/null; then  "source <(kubectl completion zsh)"; fi

  # direnv execution
  if which direnv &> /dev/null; then  eval "$(direnv hook zsh)"; fi

  # SSH hostnames
  [[ -f /usr/local/share/zsh-completions/_ssh ]] && source /usr/local/share/zsh-completions/_ssh
fi

# Google Cloud shell command completion
[[ -f ${HOME}/gcloud/google-cloud-sdk/path.${SHELL_NAME}.inc ]] && source ${HOME}/gcloud/google-cloud-sdk/path.${SHELL_NAME}.inc &>/dev/null
[[ -f ${HOME}/gcloud/google-cloud-sdk/completion.${SHELL_NAME}.inc ]] && source ${HOME}/gcloud/google-cloud-sdk/completion.${SHELL_NAME}.inc &>/dev/null

# Travis
[[ -f ${HOME}/.travis/travis.sh ]] && source ${HOME}/.travis/travis.sh

# GNU manpages for programs that are from GNU coreutils
[[ -d /usr/local/opt/coreutils/libexec/gnuman ]] && export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"

## Serverless
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.${SHELL_NAME} ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.${SHELL_NAME}
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.${SHELL_NAME} ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.${SHELL_NAME}
