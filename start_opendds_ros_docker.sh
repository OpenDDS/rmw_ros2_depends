#!/usr/bin/env bash
file_path=$HOME
container="opendds-ros2"
image="opendds-nested:ros-eloquent"
start_container="no"
while getopts ":p:c:i:s" opt; do
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
    s ) 
        start_container="yes"
    ;;    
    \? ) echo "options: [-p] path/to/volume/map [-c] container name [-i] image name [-s] start the container then connect"
    exit
    ;;
esac
done
echo $start_container
if [ $start_container == "yes" ]; then
    echo "starting "$container" "$file_path" "$image
    docker run -d --rm --name $container -v $file_path:/opt/workspace $image bash -c "while true; do sleep 5; done"
fi
docker exec -it $container bash
