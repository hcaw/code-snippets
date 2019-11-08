#! /usr/bin/env zsh
# A custom version of the watch command that shows color in macOS

# Disclaimer: This should only work in zsh!

function watch()
{
  function print_error()
  {
    if ! [[ -z "$1" ]] # If there is an argument
    then
      echo Error: $1 \\n
    fi
    echo usage: watch "<command> <period>"
    return
  }

  if (( $# == 0 || $# > 2 ))
  then
    print_error "Incorrect amount of arguments"
    return 1
  fi

  local cmd=$1
  local period=$2

  is_num='^[0-9]+([.][0-9]+)?$'

  if [[ -z "$2" ]] # If the variable is not set
  then
    local period="1"
  elif ! [[ $2 =~ $is_num ]] # If the variable is not a number
  then
    echo print_error "The period should be a number."
    return 1
  fi

  while clear
    date
    echo Executing $cmd with period: $period \\n
    eval ${cmd} # The command we want to run
    do sleep $period
  done
}
