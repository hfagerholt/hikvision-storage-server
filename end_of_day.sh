#!/bin/bash
#
#	Script used to organize folders after the day ends.
#		1. Makes folders, moves files
#		2. Creates timelapse, uploads to ftp
#		3. Deletes files older than $video_daysToKeep
#
source "config.sh"
DATE=$(date --date='yesterday' +%Y-%m-%d)
DATE2=$(date --date='2 days ago' +%Y-%m-%d)

mkdir $videoDir$DATE
mv $videoDir${DATE}* $videoDir$DATE

mkdir $snapshotDir$DATE
mv $snapshotDir${DATE}* $snapshotDir$DATE


#make timelapse from yesterdays images
find $snapshotDir -name "*.jpg" -size -1k -delete
ffmpeg -framerate $timelapse_fps -pattern_type glob -i $snapshotDir${DATE}'/*.jpg' -b:v $timelapse_bitrate -c:v $timelapse_codec $snapshotDir${DATE}/${DATE}.mp4

#Archive old timelapse
ncftp -u $ftp_user -p $ftp_password $ftp_ip <<END_SCRIPT
rename $ftp_directory$mov_tempname $ftp_directory_archive${DATE2}.mp4
quit
END_SCRIPT

#Upload new timelapse
ncftpput -u $ftp_user -p $ftp_password -X "RNFR "${DATE}.mp4 -X "RNTO "$ftp_video_filename $ftp_ip $ftp_directory ${snapshotDir}${DATE}/${DATE}.mp4
#ncftpput -u $ftp_user2 -p $ftp_password2 -X "RNFR "${DATE}.mp4 -X "RNTO "$ftp_video_filename $ftp_ip2 $ftp_directory2 ${snapshotDir}${DATE}/${DATE}.mp4

mv $snapshotDir${DATE}/${DATE}.mp4 $timelapseDir

####### Delete old files
sleep 5

find $videoDir -mtime +$video_daysToKeep -exec rm {} +
sleep 1
find $videoDir -type d -empty -delete
