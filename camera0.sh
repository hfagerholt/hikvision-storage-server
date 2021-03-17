#!/bin/bash
source "config.sh"
while true
do
ffmpeg -rtsp_transport tcp -stimeout 6000000 -i $streamurl -c copy -flags +global_header -f segment -strftime 1 -reset_timestamps 1 -segment_time $video_segment -segment_format mp4 ${videoDir}"%Y-%m-%d_%H_%M_%03d.mp4"
sleep 15
done
