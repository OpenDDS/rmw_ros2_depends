#!/usr/bin/env bash
file_path="."
while getopts ":p:" opt; do
case ${opt} in
    p ) 
        file_path=$OPTARG
    ;;
    \? ) echo "options: [-p] path/to/volume/map"
    exit
    ;;
esac
done

docker run -it --rm -v $file_path:/opt/workspace opendds-nested:ros-eloquent bash