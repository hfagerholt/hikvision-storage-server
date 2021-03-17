#!/bin/bash
source "config.sh"
find $videoDir -mtime +$video_daysToKeep -exec rm {} +
sleep 1
find $videoDir -type d -empty -delete
