#!/bin/bash

# alias of 'grep -r REGEXP PATH'
# argument:
#   1st [regexp] : constraint NOT null
#   2nd [path]   : defult is './'
#
# description:
# from
#   grep -r '[0-9]\s[a-z]' ./
# to
#   gr [0-9]\s[a-z]
#
# from
#   grep -r '[0-9]\s[a-z]' ./yourdiretory/foo
# to
#   gr [0-9]\s[a-z] ./yourdiretory/foo

gr() {
  FIND_REGEXP=$1
  PATH_TO=$2

  set_find_path() {
    if [ -z "$PATH_TO" ]; then
      PATH_TO='./' 
    fi  
  }

  usage() {
    echo 'Usage:'
    echo '  $ gr [find regexp without single quote] [path(default is ./)]'
    echo '  $ gr [0-9]\.\s[a-zA-Z]'
  }

  if [ -n "$FIND_REGEXP" ]; then
    set_find_path
    grep -r $FIND_REGEXP $PATH_TO --exclude-dir=.git
  else
    usage
  fi
}

# Referred to -n, -z
# http://d.hatena.ne.jp/masa_edw/20080422/1208834378
