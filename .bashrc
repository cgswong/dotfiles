# Add `~/bin` to the `$PATH`
PATH="${HOME}/bin:$PATH" ; export PATH

# Load the shell dotfiles, and then some:
# * ${HOME}/.path can be used to extend `$PATH`.
# * ${HOME}/.extra can be used for other settings you don’t want to commit.
for file in ${HOME}/.{extra,creds,path,bash_prompt,aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

unset file

