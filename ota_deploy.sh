#!/bin/bash

# Parse command-line options
# Option strings
SHORT=vf:
LONG=verbose,arg1:

# read the options
OPTS=$(getopt --options $SHORT --long $LONG --name "$0" -- "$@")
if [ $? != 0 ] ; then echo "Failed to parse options...exiting." >&2 ; exit 1 ; fi
eval set -- "$OPTS"

# set initial values
VERBOSE=false
arg1=none

# extract options and their arguments into variables.
while true ; do
  case "$1" in
    -v | --verbose )
      VERBOSE=true
      shift
      ;;
    --arg1 )
      ARG1="$2"
      echo $2 > allxonOTA.args
      shift 2
      ;;
    -- )
      shift
      break
      ;;
    *)
      echo "Internal error!"
      exit 1
      ;;
  esac
done

active_user=$(who | awk 'NR==1{print $1}')
cp allxonOTA.args /home/$active_user/Desktop/allxonOTA.args

echo "OTA exited...."
