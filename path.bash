pathmunge () {
  case ":${PATH}:" in
    *:"$1":*)
    ;;
    *)
      if [ "$2" = "after" ] ; then
        PATH=$PATH:$1
      else
        PATH=$1:$PATH
      fi
  esac
}

# PATH
[[ -d "/usr/local/opt/openssl@1.1/bin" ]] && pathmunge "/usr/local/opt/openssl@1.1/bin"
[[ -d /usr/local/sbin ]] && pathmunge /usr/local/sbin
# Add personal bin to $PATH
[[ -d ${HOME}/scripts ]] && pathmunge ${HOME}/scripts
[[ -d ${HOME}/.toolbox/bin ]] && pathmunge ${HOME}/.toolbox/bin
[[ -d ${HOME}/.local/bin ]] && pathmunge ${HOME}/.local/bin
[[ -d ${HOME}/bin ]] && pathmunge ${HOME}/bin
[[ -d ${HOME}/.ebcli-virtual-env/executables ]] && pathmunge ${HOME}/.ebcli-virtual-env/executables
# Homebrew coreutils
[[ -d /usr/local/opt/coreutils/libexec/gnubin ]] && pathmunge /usr/local/opt/coreutils/libexec/gnubin after
# Add rbenv to PATH so that it loads every time you open a terminal
[[ -d ${HOME}/.rbenv/bin ]] && pathmunge ${HOME}/.rbenv/bin
# Add pyenv to PATH so that it loads every time you open a terminal
[[ -d ${HOME}/.pyenv/bin ]] && pathmunge ${HOME}/.pyenv/bin
[[ -d ${HOME}/.pyenv/shims ]] && pathmunge ${HOME}/.pyenv/shims
# Add krew to PATH
[[ -d ${HOME}/.krew/bin ]] && pathmunge ${HOME}/.krew/bin
# Add Okta AWS CLI plugin
[[ -d ${HOME}/.okta/bin ]] && pathmunge ${HOME}/.okta/bin
export PATH

unset -f pathmunge
