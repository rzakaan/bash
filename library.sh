#!/bin/bash

# Define constants
declare -r TRUE=0
declare -r FALSE=1
declare -r ROOT_UID=0
declare -r PASSWD_FILE=/etc/passwd
declare -r LOG_DIR=/var/log

#---------------------------------------------------------------
# Return 0 if current user is root
# Arguments:
#   No args
#---------------------------------------------------------------
is_user_root() {
 # root user has user id (UID) zero.
 [ $(id -u) -eq $ROOT_UID ] && return $TRUE || return $FALSE
}

#---------------------------------------------------------------
# Display an error message and die
# Arguments:
#   $1 -> Message
#   $2 -> Exit status (optional)
#---------------------------------------------------------------
die() {
  local mes=${1:-Undefined error}
  local err=${2-1}
  echo $mes
  exit $err
}

#---------------------------------------------------------------
# Converts string to lowercase
# Arguments:
#   $1 -> String
#---------------------------------------------------------------
to_lower() {
    local str="$@"
    local output
    output=$(tr '[A-Z]' '[a-z]' <<< "${str}")
    echo $output
}

#---------------------------------------------------------------
# Converts string to uppercase
# Arguments:
#   $1 -> String
#---------------------------------------------------------------
to_upper() {
    local str="$@"
    local output
    output=$(tr '[a-z]' '[A-Z]' <<< "${str}")
    echo $output
}

#---------------------------------------------------------------
# Return true user exits in /etc/passwd
# Arguments: 
#   $1 -> Username to check in /etc/passwd
#---------------------------------------------------------------
is_user_exits() {
    local u="$1"
    grep -q "^${u}" $PASSWD_FILE && return $TRUE || return $FALSE
}
