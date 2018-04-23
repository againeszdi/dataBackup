#!/bin/bash

#set working directory to /home/zditech
read -p "GO Name: " filename
sleep 10
cd /home/zditech

#create tar file with name specified in command
tar -zcf $filename.tar.gz /data
echo "-----------------------------------------"
echo " "
#send file to spark room
postData=$(curl -s -X POST -H "Authorization: Bearer NmExYTNlYzQtYjc3Yy00MDdjLThiZmMtYzZjOTU3NDJjMzdjMjFhMmNiNTktOGQz" -F "files=@/home/zditech/$filename.tar.gz;type=application/gzip" -F "roomId=Y2lzY29zcGFyazovL3VzL1JPT00vZWJmMWE0NTAtMTY1Ni0xMWU3LTg2YzgtMjMzN2U0Nzg0OTlm" -F "text=$filename backup." https://api.ciscospark.com/v1/messages)
echo "$postData"
rm /home/zditech/$filename.tar.gz
#send file URL to spark room
curl -s -X POST http://recvmsg.cwtest.ultrahook.com -d "$postData"
echo "-----------------------------------------"
echo "COPY THE 'files' URL FROM THE ABOVE OUTPUT AND USE IT TO RUN THE restoreBackup.sh SCRIPT ONCE THE GO HAS BEEN MOVED."
echo "Example: sh restoreBackup.sh https://api.ciscospark.com/v1/contents/Y2lzY29zcGFyazovL3VzL0NPTlRFTlQvNzVlNDRjOC0xMWU4LWE5MTYtNzc3OGQ4ODNkNTBiLzA\n"
