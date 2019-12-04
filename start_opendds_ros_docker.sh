#!/usr/bin/env bash
file_path="."
container="opendds-ros2"
exec_mode="no"
while getopts ":p:c:e" opt; do
case ${opt} in
    p ) 
        file_path=$OPTARG
    ;;
    c ) 
        container=$OPTARG
    ;;    
    e ) 
        exec_mode="yes"
    ;;    
    \? ) echo "options: [-p] path/to/volume/map [-c] container name [-e] connect to an existing container"
    exit
    ;;
esac
done

if [ $exec_mode == "no" ]; then
    docker run -it --rm -name $container -v $file_path:/opt/workspace opendds-nested:ros-eloquent bash
else
    docker exec -it $container bash
fi