FROM ros:eloquent

RUN apt-get update && apt-get install -y \
    cmake \
    curl \
    g++ \
    google-mock \
    make \
    libgtest-dev \
    libxerces-c-dev \
    libssl-dev \
    perl-base \
    perl-modules \
    wget \ 
    unzip

WORKDIR /usr/src/gtest
RUN cmake CMakeLists.txt && make && cp ./*.a /usr/lib
WORKDIR /usr/src/gmock
RUN cmake CMakeLists.txt && make && cp ./*.a /usr/lib

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y --no-install-recommends nodejs

WORKDIR /opt/
RUN wget https://github.com/objectcomputing/OpenDDS/archive/master.zip && unzip master.zip && mv OpenDDS-master OpenDDS

RUN cd /opt/OpenDDS && \
    ./configure --prefix=/usr/local --security --doc-group --no-tests --std=c++11 && \
    make && \
    make install && \
    cp -a /opt/OpenDDS/ACE_wrappers/MPC /usr/local/share/ace/MPC && \
    cd /opt/OpenDDS/tools/repeater && \
    npm install

ENV ACE_ROOT=/usr/local/share/ace \
    TAO_ROOT=/usr/local/share/tao \
    DDS_ROOT=/usr/local/share/dds \
    PATH=".:/usr/local/share/ace/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

WORKDIR /opt/OpenDDS/tests/DCPS/Messenger
RUN mwc.pl -type gnuace && make

WORKDIR /opt/workspace

#additional ROS2 deps
RUN apt-get update && apt-get install -y \
  libasio-dev \
  libtinyxml2-dev \
  liblog4cxx-dev
