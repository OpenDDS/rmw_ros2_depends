ARG ROS_DISTRO=foxy
FROM ros:$ROS_DISTRO

#additional ROS2 deps
RUN apt-get update && apt-get install -y \
  libasio-dev \
  libtinyxml2-dev \
  liblog4cxx-dev \
  gdb \
  ccache \
  ros-$ROS_DISTRO-rosidl-generator-dds-idl \
  ros-$ROS_DISTRO-test-msgs \
  ros-$ROS_DISTRO-osrf-testing-tools-cpp \
  ros-$ROS_DISTRO-launch-testing-ament-cmake
