#!/bin/bash
source "config.sh"
DATE=$(date --date='yesterday' +%Y-%m-%d)
ffmpeg -framerate $timelapse_fps -pattern_type glob -i $snapshotDir${DATE}'/*.jpg' -b:v $timelapse_bitrate -c:v $timelapse_codec $snapshotDir${DATE}/${DATE}.mp4
ncftpput -u $ftp_user -p $ftp_password -X "RNFR "${DATE}.mp4 -X "RNTO "$ftp_video_filename $ftp_ip $ftp_directory ${snapshotDir}${DATE}/${DATE}.mp4
