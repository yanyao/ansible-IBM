#!/bin/sh
####login storage mapping the snapshot volume to the KLN11_LPAR22 host
ssh superuser@192.168.143.59  "svctask mkvdiskhostmap -force -host 8  snap_HKG_KLN11_datavg_0"

####get the uuid of snapshot volume
UUID=`ssh superuser@192.168.143.59  "lsvdisk snap_HKG_KLN11_datavg_0|grep -i vdisk_UID"|awk '{print $2}'`
echo $UUID
