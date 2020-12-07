#!/bin/sh
echo "Start Restore:" | tee -a /tmp/restorevg.log
cfgmgr
#600507681080802AA80000000000003F
#$1 is uuid
UUID=$1
echo "Input UUID:  $1"
echo "Input UUID is: ${UUID}"
date | tee -a /tmp/restorevg.log
#NEWDISK=`diff ./lspv1.log ./lspv2.log | awk {'print $2'} | grep hdisk`

for HDISK in `lsdev | grep -i hdisk | awk {'print $1'}`
do
lsattr -El ${HDISK} | grep -i  ${UUID}
  if [[ $? -eq 0 ]]
  then
        NEWDISK=${HDISK}
  fi
done
echo "New cloned disk is: $NEWDISK"
/usr/sbin/importvg -y 'datavg' $NEWDISK
