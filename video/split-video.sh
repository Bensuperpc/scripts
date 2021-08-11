#!/usr/bin/env bash
#//////////////////////////////////////////////////////////////
#//   ____                                                   //
#//  | __ )  ___ _ __  ___ _   _ _ __   ___ _ __ _ __   ___  //
#//  |  _ \ / _ \ '_ \/ __| | | | '_ \ / _ \ '__| '_ \ / __| //
#//  | |_) |  __/ | | \__ \ |_| | |_) |  __/ |  | |_) | (__  //
#//  |____/ \___|_| |_|___/\__,_| .__/ \___|_|  | .__/ \___| //
#//                             |_|             |_|          //
#//////////////////////////////////////////////////////////////
#//                                                          //
#//  Script, 2021                                            //
#//  Created: 11, August, 2021                               //
#//  Modified: 11, August, 2021                              //
#//  file: -                                                 //
#//  -                                                       //
#//  Source:                                                 //
#//  OS: ALL                                                 //
#//  CPU: ALL                                                //
#//                                                          //
#//////////////////////////////////////////////////////////////


type ffmpeg >/dev/null 2>&1 || { echo "ffmpeg could not be found" >&2; exit 1; }

if (( $# == 2 )); then
    ffmpeg -i "$1" -c copy -map 0 -segment_time "$2" \
        -reset_timestamps 1 -f segment output%03d.mkv
else
    echo "Usage: ${0##*/} <input video> <time (00:20:00 for parts of 20 minutes)>"
    exit 1
fi