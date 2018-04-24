echo "#!/bin/bash
#set working directory to /home/zditech
cd /home/zditech
read -p \"GO Name (no spaces): \" filename
#create tar file with name specified in command
tar -zcf \$filename.tar.gz /data 2>/dev/null
echo \"-----------------------------------------\"
echo \" \"
#send file to spark room
postData=\$(curl -s -X POST -H \"Authorization: Bearer NmExYTNlYzQtYjc3Yy00MDdjLThiZmMtYzZjOTU3NDJjMzdjMjFhMmNiNTktOGQz\" -F \"files=@/home/zditech/\$filename.tar.gz;type=application/gzip\" -F \"roomId=Y2lzY29zcGFyazovL3VzL1JPT00vZWJmMWE0NTAtMTY1Ni0xMWU3LTg2YzgtMjMzN2U0Nzg0OTlm\" -F \"text=\$filename backup.\" https://api.ciscospark.com/v1/messages)
backupData=\${postData::-1}
backupData+=\",\"goName\":\"\$filename\"}\"
echo \"\$backupData\"
rm /home/zditech/\$filename.tar.gz
#send file URL to spark room
curl -s -X POST http://recvmsg.cwtest.ultrahook.com -d \"\$backupData\"
echo \"Backup Complete\"
echo \"-----------------------------------------\"
echo \"COPY THE 'files' URL FROM THE ABOVE OUTPUT AND USE IT TO RUN THE restoreBackup.sh SCRIPT ONCE THE GO HAS BEEN MOVED.\"
echo \"Example: sh restoreBackup.sh https://api.ciscospark.com/v1/contents/Y2lzY29zcGFyazovL3VzL0NPTlRFTlQvNzVlNDRjOC0xMWU4LWE5MTYtNzc3OGQ4ODNkNTBiLzA\"" > /home/zditech/dataBackup.sh
