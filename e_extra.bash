# Set environment for processes
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
export AWS_DEFAULT_REGION="us-east-1"
export AWS_CREDENTIAL_FILE=~/.aws/credentials

# Kubernetes
[[ -z "$KUBECONFIG" ]] && KUBECONFIG=${HOME}/.kube/config:${HOME}/.kube/config-ekspreview || KUBECONFIG=${KUBECONFIG}:${HOME}/.kube/config-ekspreview

## Programming paths
# Go environment
[[ -d ${HOME}/workspace/gocode ]] && export GOPATH=${HOME}/workspace/gocode

# Python virtual environments
[[ -d ${HOME}/.virtualenvs ]] && export WORKON_HOME=${HOME}/.virtualenvs
[[ -d ${HOME}/workspace ]] && export PROJECT_HOME=${HOME}/workspace
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

# Link Brew Cask applications to normal location
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

## TAB completion
# Load Ruby's rbenv
if which rbenv &> /dev/null; then  eval "$(rbenv init -)"; fi

# Load pyenv autocompletion
if which pyenv &> /dev/null; then  eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init &> /dev/null; then  eval "$(pyenv virtualenv-init -)"; fi

# Load nodenv
if which nodenv &>/dev/null; then  eval "$(nodenv init -)"; fi

if [[ ${SHELL} == *"bash" ]]; then
  # Enable some Bash 4 features when possible:
  # autocd: e.g. `**/qux` will enter `./foo/bar/baz/qux`
  # cdspell: Autocorrect typos in path names when using `cd`
  # globstar: Recursive globbing, e.g. `echo **/*.txt`
  # histappend: Append to the Bash history file, rather than overwriting it
  # nocaseglob: Case-insensitive globbing (used in pathname expansion)
  for option in autocd cdspell globstar histappend nocaseglob; do
    shopt -s "$option" 2> /dev/null
  done;

  # Brewed Bash command tab completion
  if which brew &> /dev/null && [[ -f "/usr/local/etc/bash_completion" ]]; then
    source "/usr/local/etc/bash_completion"
  elif [[ -f /etc/bash_completion ]]; then
    source /etc/bash_completion
  fi

  # Enable tab completion for `g` by marking it as an alias for `git`
  if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    complete -o default -o nospace -F _git g
  fi

  # Add tab completion for `defaults read|write NSGlobalDomain`
  # You could just use `-g` instead, but I like being explicit
  complete -W "NSGlobalDomain" defaults;

  # AWS shell command completion
  [[ -f /usr/local/bin/aws_completer ]] && complete -C '/usr/local/bin/aws_completer' aws

  # kubectl completion
  [[ -f /usr/local/etc/bash_completion.d/kubectl ]] && source /usr/local/etc/bash_completion.d/kubectl &>/dev/null

  # direnv execution
  #if which direnv &> /dev/null; then  eval "$(direnv hook bash)"; fi

  # SSH hostnames
  [[ -f /usr/local/etc/bash_completion.d/ssh_hosts ]] && source /usr/local/etc/bash_completion.d/ssh_hosts &>/dev/null
else
## Assume zsh
  # AWS shell command completion
  [[ -f /usr/local/bin/aws_zsh_completer.sh ]] && source /usr/local/bin/aws_zsh_completer.sh &>/dev/null

  # kubectl completion
  [[ -f ${HOME}/bin/kubectl ]] && source <(kubectl completion zsh)

  # direnv execution
  #if which direnv &> /dev/null; then  eval "$(direnv hook zsh)"; fi

  # SSH hostnames
  [[ -f /usr/local/share/zsh-completions/_ssh ]] && source /usr/local/share/zsh-completions/_ssh
fi

# Google Cloud shell command completion
[[ -f ${HOME}/gcloud/google-cloud-sdk/path.$(basename ${SHELL}).inc ]] && source ${HOME}/gcloud/google-cloud-sdk/path.$(basename ${SHELL}).inc &>/dev/null
[[ -f ${HOME}/gcloud/google-cloud-sdk/completion.$(basename ${SHELL}).inc ]] && source ${HOME}/gcloud/google-cloud-sdk/completion.$(basename ${SHELL}).inc &>/dev/null

# iTerm2 shell integration
[[ -f ~/.iterm2_shell_integration.$(basename ${SHELL}) ]] && source ~/.iterm2_shell_integration.$(basename ${SHELL}) &>/dev/null

# Travis
[[ -f ${HOME}/.travis/travis.sh ]] && source ${HOME}/.travis/travis.sh

## Serverless
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
