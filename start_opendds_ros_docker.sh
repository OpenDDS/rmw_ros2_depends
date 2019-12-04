#!/usr/bin/env bash
file_path="."
container="opendds-ros2"
image="opendds-nested:ros-eloquent"
exec_mode="no"
while getopts ":p:c:i:e" opt; do
case ${opt} in
    p ) 
        file_path=$OPTARG
    ;;
    c ) 
        container=$OPTARG
    ;;    
    i ) 
        image=$OPTARG
    ;;   
    e ) 
        exec_mode="yes"
    ;;    
    \? ) echo "options: [-p] path/to/volume/map [-c] container name [-i] image name [-e] connect to an existing container"
    exit
    ;;
esac
done

if [ $exec_mode == "no" ]; then
    docker run -it --rm --name $container -v $file_path:/opt/workspace $image bash
else
    docker exec -it $container bash
fi