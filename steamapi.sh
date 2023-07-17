#!/bin/bash

IP=""
KEY=""
PORT=""
USAGE="

$0 [-h ] [-i]  
   -i IP
   -k KEY
   -p PORT
   -h HELP
"


while getopts k:i:p:h: option; do
    case "${option}" in
        i) IP=${OPTARG}
            ;;
	k) KEY=${OPTARG}
		;;
        p) PORT=${OPTARG}
                ;;
        h|*)echo "$USAGE"
            exit 0
            ;;
    esac
done


API_URL="https://api.steampowered.com/IGameServersService/GetServerList/v1"
 
response=$(curl -s -G -d filter=\addr\\$IP:$PORT \
	$API_URL/?key=$KEY)

     if [[ "$response" == *"servers"* ]]; then 
	     echo "OK - Server is Up: $response"
	     exit 0
     else 
	     echo "CRIT - Server not found: $response"
	     exit 2
     fi

