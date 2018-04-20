#!/bin/bash

#set working directory to /home/zditech
cd /home/zditech

#create tar file with name specified in command
tar -zcf $1.tar.gz /data
echo "\n"
echo "--------------------------------------------------------------------------------------------"
echo "\n"

#send file to spark room
curl -s -X POST -H "Authorization: Bearer NmExYTNlYzQtYjc3Yy00MDdjLThiZmMtYzZjOTU3NDJjMzdjMjFhMmNiNTktOGQz" -F "files=@/home/zditech/$1.tar.gz;type=application/gzip" -F "roomId=Y2lzY29zcGFyazovL3VzL1JPT00vZWJmMWE0NTAtMTY1Ni0xMWU3LTg2YzgtMjMzN2U0Nzg0OTlm" -F "text=$1 Backup file." https://api.ciscospark.com/v1/messages
echo "\n"
echo "--------------------------------------------------------------------------------------------"
echo "COPY THE 'files' URL FROM THE ABOVE OUTPUT"
echo "\n"