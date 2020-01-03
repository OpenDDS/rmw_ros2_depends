ARG BASIS=ros:eloquent
FROM $BASIS

#additional ROS2 deps
RUN apt-get update && apt-get install -y \
  libasio-dev \
  libtinyxml2-dev \
  liblog4cxx-dev \
  ros-eloquent-rosidl-generator-dds-idl
