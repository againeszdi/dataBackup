#!/bin/bash

#set working directory to /home/zditech
cd /home/zditech

#create tar file with name specified in command
tar -zcf $1.tar.gz /data
echo " "
echo "-----------------------------------------"
echo " "
#send file to spark room
curl -s -X POST -H "Authorization: Bearer NmExYTNlYzQtYjc3Yy00MDdjLThiZmMtYzZjOTU3NDJjMzdjMjFhMmNiNTktOGQz" -F "files=@/home/zditech/$1.tar.gz;type=application/gzip" -F "roomId=Y2lzY29zcGFyazovL3VzL1JPT00vZWJmMWE0NTAtMTY1Ni0xMWU3LTg2YzgtMjMzN2U0Nzg0OTlm" -F "text=$1 Backup file." https://api.ciscospark.com/v1/messages
rm /home/zditech/$1.tar.gz
echo " "
echo "-----------------------------------------"
echo " "
echo "COPY THE 'files' URL FROM THE ABOVE OUTPUT AND USE IT TO RUN THE restoreBackup.sh SCRIPT ONCE THE GO HAS BEEN MOVED."
echo " "
echo "Example: sh restoreBackup.sh https://api.ciscospark.com/v1/contents/Y2lzY29zcGFyazovL3VzL0NPTlRFTlQvNzVlYTA4YTAtNDRjOC0xMWU4LWE5MTYtNzc3OGQ4ODNkNTBiLzA"
echo "\n"
