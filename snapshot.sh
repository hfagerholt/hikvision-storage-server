#!/bin/bash
source "config.sh"
sleep 20
# Get date format (which will be file name later)
date=$(date '+%Y-%m-%d_%H%M')
# Search pic folder for a pic modified within 1 minutes, if found, make a copy with datetime as name
test=$(find $snapshotDir -name "$pic_tempname2"  -mmin -1 )
[ ! -z $test ] && cp $snapshotDir$pic_tempname2 $snapshotDir${date}.jpg
#identify $snapshotDir$date && echo "true jpg" || rm $snapshotDir$date
