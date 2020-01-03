ARG ROS_DISTRO=eloquent
FROM ros:$ROS_DISTRO

#additional ROS2 deps
RUN apt-get update && apt-get install -y \
  libasio-dev \
  libtinyxml2-dev \
  liblog4cxx-dev \
  ros-$ROS_DISTRO-rosidl-generator-dds-idl
