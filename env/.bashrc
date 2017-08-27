# .bashrc

# Source global definitions

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# functions

## declare

cdls() {
  \cd "$@" && ls
}

function rerun() {
  case $1 in
  "bash")
    source ~/.bashrc
    ;;
  *)
    echo "rerun [object]"
    echo "      object is -- bash"
  esac
}

# alias

alias cd="cdls"
