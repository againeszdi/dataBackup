echo "#!/bin/bash
#set working directory to /home/zditech
cd /home/zditech
echo \"-----------------------------------------\"
read -p \"GO Name (no spaces): \" filename
#create tar file with name specified in command
tar -zcf \$filename.tar.gz /data 2>/dev/null
echo \" \"
#send file to spark room
postData=\$(curl -s -X POST -H \"Authorization: Bearer NmExYTNlYzQtYjc3Yy00MDdjLThiZmMtYzZjOTU3NDJjMzdjMjFhMmNiNTktOGQz\" -F \"files=@/home/zditech/\$filename.tar.gz;type=application/gzip\" -F \"roomId=Y2lzY29zcGFyazovL3VzL1JPT00vZWJmMWE0NTAtMTY1Ni0xMWU3LTg2YzgtMjMzN2U0Nzg0OTlm\" -F \"text=\$filename backup.\" https://api.ciscospark.com/v1/messages)
backupData=\${postData%?}" > /home/zditech/dataBackup.sh
echo 'backupData="$backupData,\"goName\":\"$filename\"}"' >> /home/zditech/dataBackup.sh
echo "rm /home/zditech/\$filename.tar.gz
#send file URL to spark room
curl -s -X POST http://recvmsg.cwtest.ultrahook.com -d \"\$backupData\"
echo \"Backup of \$filename complete\"
echo \"-----------------------------------------\"" >> /home/zditech/dataBackup.sh
