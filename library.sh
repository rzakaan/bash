#!/bin/bash

# Define constants
declare -r TRUE=0
declare -r FALSE=1
declare -r ROOT_UID=0
declare -r PASSWD_FILE=/etc/passwd
declare -r LOG_DIR=/var/log

#---------------------------------------------------------------
# Check current user is root
# Args:
#   - No args
# Return:
#   if current user is root return TRUE(1) otherwise return FALSE(0)
#---------------------------------------------------------------
is_user_root() {
 # root user has user id (UID) zero.
 [ $(id -u) -eq $ROOT_UID ] && return $TRUE || return $FALSE
}

#---------------------------------------------------------------
# Display an error message and die
# Args:
#   - $1 (str) : Error message
#   - $2 (int) : Exit status (optional)
#---------------------------------------------------------------
die() {
  local mes=${1:-Undefined error}
  local err=${2-1}
  echo $mes
  exit $err
}

#---------------------------------------------------------------
# Converts string to lowercase
# Args:
#   - $1 (str) : A string that will to lower
#---------------------------------------------------------------
to_lower() {
    local str="$@"
    local output
    output=$(tr '[A-Z]' '[a-z]' <<< "${str}")
    echo $output
}

#---------------------------------------------------------------
# Converts string to uppercase
# Args:
#   - $1 (str) : A string that will to upper
#---------------------------------------------------------------
to_upper() {
    local str="$@"
    local output
    output=$(tr '[a-z]' '[A-Z]' <<< "${str}")
    echo $output
}

#---------------------------------------------------------------
# Return true user exits in /etc/passwd
# Args: 
#   - $1 (str) : Username to check in /etc/passwd
#---------------------------------------------------------------
is_user_exits() {
    local u="$1"
    grep -q "^${u}" $PASSWD_FILE && return $TRUE || return $FALSE
}
