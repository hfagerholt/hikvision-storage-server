#!/bin/bash
# camera0 Config
user="user"	 # View only account
password="password"
ip="256.256.256.256"
vport="554"		 # Video port.   Forward this on camera network
pport="8080"		 # Picture port. ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#
# URLs:
streamurl="rtsp://"${user}":"${password}"@"${ip}":"${vport}
pictureurl="http://"${user}:${password}"@"${ip}:${pport}"/ISAPI/streaming/channels/101/picture"

#
# Video settings:
video_segment=600
video_daysToKeep=80

#
# Timelapse settings:
timelapse_fps=60
timelapse_codec="libx264"
timelapse_bitrate="14M"

#
# Storage locations.
dataDir="/data0/camera0/"
videoDir=${dataDir}"video/"
snapshotDir=${dataDir}"snapshot/"
timelapseDir=${dataDir}"timelapse/"

#
# FTP settings
ftp_user="ftp-user"
ftp_password="ftp-password"
ftp_ip="257.257.257.257"
ftp_directory="/www/"
ftp_directory_archive=${ftp_directory}"arkiv/"
ftp_video_filename="mov.mp4"

# 2nd FTP user, commented out in other files too.
#ftp_user2="ftp2-user"
#ftp_password2="ftp2-password"
#ftp_ip2="258.258.258.258"
#ftp_directory2="/www/"

#
# Temporary names
pic_tempname="pic.jpg"
pic_tempname2="pic2.jpg"
mov_tempname="mov.mp4"
