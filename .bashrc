# Load the shell dotfiles, and then some:
for file in ${HOME}/dotfiles/*.bash; do
  [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

# Bash-it
export BASH_IT_CUSTOM=${HOME}/dotfiles
export BASH_IT_THEME="bobby"
export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1
