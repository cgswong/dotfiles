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
[[ -d /usr/local/opt/openssl/bin ]] && pathmunge /usr/local/opt/openssl/bin
[[ -d /usr/local/sbin ]] && pathmunge /usr/local/sbin
# Add personal bin to $PATH
[[ -d ${HOME}/.local/bin ]] && pathmunge ${HOME}/.local/bin
[[ -d ${HOME}/bin ]] && pathmunge ${HOME}/bin
# Homebrew coreutils
[[ -d $(brew --prefix coreutils)/libexec/gnubin ]] && pathmunge "$(brew --prefix coreutils)/libexec/gnubin"
# GoLang
[[ -d ${GOROOT}/bin ]] && pathmunge ${GOROOT}/bin
# Add rbenv to PATH so that it loads every time you open a terminal
[[ -d ${HOME}/.rbenv/bin ]] && pathmunge ${HOME}/.rbenv/bin

export PATH

unset -f pathmunge
