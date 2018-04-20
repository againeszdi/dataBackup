#!/bin/bash

#set working directory to /home/zditech
cd /home/zditech

#create tar file with name specified in command
tar -zcf $1.tar.gz /data
echo "\n-----------------------------------------\n"
#send file to spark room
postData=$(curl -X POST -H "Authorization: Bearer NmExYTNlYzQtYjc3Yy00MDdjLThiZmMtYzZjOTU3NDJjMzdjMjFhMmNiNTktOGQz" -F "files=@/home/zditech/$1.tar.gz;type=application/gzip" -F "roomId=Y2lzY29zcGFyazovL3VzL1JPT00vZWJmMWE0NTAtMTY1Ni0xMWU3LTg2YzgtMjMzN2U0Nzg0OTlm" -F "text=$1 backup." https://api.ciscospark.com/v1/messages)
rm /home/zditech/$1.tar.gz
#send file URL to spark room
curl -X POST http://recvmsg.cwtest.ultrahook.com -d '$postData'
echo "\n\n-----------------------------------------\nCOPY THE 'files' URL FROM THE ABOVE OUTPUT AND USE IT TO RUN THE restoreBackup.sh SCRIPT ONCE THE GO HAS BEEN MOVED.\n\nExample: sh restoreBackup.sh https://api.ciscospark.com/v1/contents/Y2lzY29zcGFyazovL3VzL0NPTlRFTlQvNzVlNDRjOC0xMWU4LWE5MTYtNzc3OGQ4ODNkNTBiLzA\n"
