#!/bin/bash
curl -s -H "Authorization: Bearer NmExYTNlYzQtYjc3Yy00MDdjLThiZmMtYzZjOTU3NDJjMzdjMjFhMmNiNTktOGQz" $url > /home/zditech/retrieved-backup.tar.gz
mkdir /home/zditech/retrieved-backup
tar -zxf /home/zditech/retrieved-backup.tar.gz --directory /home/zditech/retrieved-backup
cp /home/zditech/retrieved-backup/data/99-usb-serial.rules /data/99-usb-serial.rules 2>/dev/null
cp /home/zditech/retrieved-backup/data/codec.cfg /data/codec.cfg 2>/dev/null
cp /home/zditech/retrieved-backup/data/*.json /data/ 2>/dev/null
if [ -d "/home/zditech/retrieved-backup/data/slides" ]; then
  mkdir /data/slides 2>/dev/null
  cp /home/zditech/retrieved-backup/data/slides/*.png /data/slides/ 2>/dev/null
fi
rm -r /home/zditech/retrieved-backup
rm /home/zditech/retrieved-backup.tar.gz
echo " "
echo "Restore Complete"
echo " "
