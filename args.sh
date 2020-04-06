#!/bin/bash - 
#===============================================================================
#
#          FILE: args.sh
# 
#         USAGE: ./args.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: NIX (), nix@nix.bg
#  ORGANIZATION: GNU
#       CREATED: 04/04/2020 10:35:05 AM
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error
set -e

if [ -z $1 ]; then echo ARGS are not set $0 exit;exit 1 ;fi

args=("$@")

echo Total args are: ${#args[@]}

for ((index=0; index <= ${#args[@]}; index++)); do
    #echo Processing: ${args[index]}
    if echo ${args[index]} | grep -q ^-;then
        #echo OPTIONS: ${args[index+1]}
        #cases for options -
        case ${args[index]} in
            -f)
            FILE=${args[index+1]}
            #echo $FILE
            ;;
            -v)
            VERBOSE=${args[index+1]}
            #echo $VERBOSE
            ;;
            -u)
            RUN_AS=${args[index+1]}
            #echo $RUN_AS
            ;;
        esac
    elif ! echo ${args[index-1]} | grep -q ^-;then
        #echo ACTIONS: ${args[index]}
        #cases for actions
        case ${args[index]} in
            create)
            declare -rx ACTION="${args[index]}" || echo Variable ACTION is already set!
            #echo $ACTION
            ;;
            update)
            declare -rx ACTION="${args[index]}" || echo Variable ACTION is already set!
            #echo $ACTION
            ;;
        esac
    fi
done

echo Args processed: $ACTION:$FILE:$VERBOSE:$RUN_AS

exit 0
