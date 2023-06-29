#!/bin/sh

echoAndRun(){
    pwd
    echo "${ECHO_GREEN_COLOR}Running${ECHO_NO_COLOR} \"$1\""
    $1
    echo ""
}

# NO OUTPUT VARIABLES
