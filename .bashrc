# Load the shell dotfiles, and then some:
for file in ${HOME}/dotfiles/*.bash; do
  [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

# Bash-it
export BASH_IT="/Users/cgwong/.bash_it"
export BASH_IT_CUSTOM=${HOME}/dotfiles
export BASH_IT_THEME="bobby"
export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1
unset MAILCHECK

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cgwong/google-cloud-sdk/path.bash.inc' ]; then source '/Users/cgwong/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/cgwong/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/cgwong/google-cloud-sdk/completion.bash.inc'; fi

# Load Bash It
#ource "$BASH_IT"/bash_it.sh
