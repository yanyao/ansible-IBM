#!/bin/sh
#####login storage create  snapshot vdisk
ssh superuser@192.168.143.59 "svctask mkvdisk -autoexpand -grainsize 256 -iogrp io_grp0_F9100 -mdiskgrp FCM_96_12  -name snap_HKG_KLN11_datavg_0 -node node1 -rsize 0% -size 322122547200 -unit b"
#####login storage make snapshot mapping
ssh superuser@192.168.143.59 "svctask mkfcmap -cleanrate 0 -copyrate 0 -source HKG_KLN11_datavg_0 -target snap_HKG_KLN11_datavg_0 -name snaptest_map"
