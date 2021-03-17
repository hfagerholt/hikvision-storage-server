#!/bin/bash
source "config.sh"

# grabs a picture from the camera
wget $pictureurl -O $snapshotDir$pic_tempname2
#ncftpput -u $ftp_user -p $ftp_password $ftp_ip $ftp_directory $snapshotDir$pic_tempname

# ncftp steps:

# 1 upload pic2.jpg
# 2 delete pic.jpg
# 3 rename pic2.jpg to pic.jpg
# 4 quit

ncftp -u $ftp_user -p $ftp_password $ftp_ip <<END_SCRIPT
cd $ftp_directory
put $snapshotDir$pic_tempname2
rm $pic_tempname
rename $pic_tempname2 $pic_tempname
quit
END_SCRIPT
