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
