#!/bin/sh

promptGCPProjectId(){
    if [ -e $TMP_DIR/$GCP_PROJECT_ID_FILE ]; then
        gcpProjectId=`cat $TMP_DIR/$GCP_PROJECT_ID_FILE`
        echo "${ECHO_YELLOW_COLOR}You previously inputted GCP Project ID as${ECHO_NO_COLOR} ${ECHO_WHITE_COLOR}\"$gcpProjectId\"${ECHO_NO_COLOR}"
        
        while true; do
            read -p "$(echo ${ECHO_YELLOW_COLOR}Use the same project id? \(${ECHO_WHITE_COLOR}Y/n${ECHO_YELLOW_COLOR}\):${ECHO_NO_COLOR}) " _decision
            case $_decision in
                Y|y ) echo ""; return 0;;
                N|n ) break;;
                * ) echo "${ECHO_RED_COLOR}Please input a valid value.${ECHO_NO_COLOR}";;
            esac
        done
    fi

    while true; do
        read -p "$(echo ${ECHO_YELLOW_COLOR}Please input your Google Cloud Platform Project ID:${ECHO_NO_COLOR}) " gcpProjectId
        case $gcpProjectId in
            "") echo "${ECHO_RED_COLOR}Please input a valid value.${ECHO_NO_COLOR}";;
            * ) echo $gcpProjectId > $TMP_DIR/$GCP_PROJECT_ID_FILE; break;;
        esac
    done
    echo "${ECHO_YELLOW_COLOR}You inputted GCP Project ID as ${ECHO_WHITE_COLOR}\"$gcpProjectId\"${ECHO_NO_COLOR}\n"
}

# OUTPUT VARIABLES
#   gcpProjectId - for GCP project id
#
