#!/bin/bash
source "config.sh"

# grabs a picture from the camera
wget $pictureurl -O $snapshotDir$pic_tempname2

#upload to ftp
ncftp -u $ftp_user -p $ftp_password $ftp_ip <<END_SCRIPT
cd $ftp_directory
put $snapshotDir$pic_tempname2
rm $pic_tempname
rename $pic_tempname2 $pic_tempname
quit
END_SCRIPT

sleep 5
# Get date format (which will be file name later)
date=$(date '+%Y-%m-%d_%H%M')
# Search pic folder for a pic modified within 1 minutes, if found, make a copy with datetime as name
test=$(find $snapshotDir -name "$pic_tempname2"  -mmin -1 )
[ ! -z $test ] && cp $snapshotDir$pic_tempname2 $snapshotDir${date}.jpg
