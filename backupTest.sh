echo "#!/bin/bash" > /home/zditech/dataBackup.sh
#set working directory to /home/zditech
echo "cd /home/zditech" >> /home/zditech/dataBackup.sh
echo "read -p \"GO Name (no spaces): \" filename" >> /home/zditech/dataBackup.sh
#create tar file with name specified in command
echo "tar -zcf \$filename.tar.gz /data" >> /home/zditech/dataBackup.sh
echo "echo \"-----------------------------------------\"" >> /home/zditech/dataBackup.sh
echo "echo \" \"" >> /home/zditech/dataBackup.sh
#send file to spark room
echo "postData=\$(curl -s -X POST -H \"Authorization: Bearer NmExYTNlYzQtYjc3Yy00MDdjLThiZmMtYzZjOTU3NDJjMzdjMjFhMmNiNTktOGQz\" -F \"files=@/home/zditech/\$filename.tar.gz;type=application/gzip\" -F \"roomId=Y2lzY29zcGFyazovL3VzL1JPT00vZWJmMWE0NTAtMTY1Ni0xMWU3LTg2YzgtMjMzN2U0Nzg0OTlm\" -F \"text=\$filename backup.\" https://api.ciscospark.com/v1/messages)" >> /home/zditech/dataBackup.sh
echo "echo \"\$postData\"" >> /home/zditech/dataBackup.sh
echo "rm /home/zditech/\$filename.tar.gz" >> /home/zditech/dataBackup.sh
#send file URL to spark room
echo "curl -s -X POST http://recvmsg.cwtest.ultrahook.com -d \"\$postData\"" >> /home/zditech/dataBackup.sh
echo "echo \"-----------------------------------------\"" >> /home/zditech/dataBackup.sh
echo "echo \"COPY THE 'files' URL FROM THE ABOVE OUTPUT AND USE IT TO RUN THE restoreBackup.sh SCRIPT ONCE THE GO HAS BEEN MOVED.\"" >> /home/zditech/dataBackup.sh
echo "echo \"Example: sh restoreBackup.sh https://api.ciscospark.com/v1/contents/Y2lzY29zcGFyazovL3VzL0NPTlRFTlQvNzVlNDRjOC0xMWU4LWE5MTYtNzc3OGQ4ODNkNTBiLzA\"" >> /home/zditech/dataBackup.sh
