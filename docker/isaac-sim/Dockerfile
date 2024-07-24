FROM nvcr.io/nvidia/isaac-sim:4.0.0
ENV DEBIAN_FRONTEND=noninteractive

# Add allow root to warm up
RUN echo " --allow-root" >> /isaac-sim/omni.isaac.sim.warmup.sh

COPY install_scripts/ros_humble_install.sh /isaac-sim/install_scripts/ros_humble_install.sh
RUN chmod +x /isaac-sim/install_scripts/ros_humble_install.sh
RUN /isaac-sim/install_scripts/ros_humble_install.sh

RUN apt-get update -y && apt-get install -y curl
RUN curl -s https://install.husarnet.com/install.sh | bash

# If you want to suppress the logs from Husarnet
# (equivalent to running Husarnet without HUSARNET_DEBUG)
RUN curl -L https://github.com/husarnet/husarnet-dds/releases/download/v1.3.6/husarnet-dds-linux-amd64 -o /usr/local/bin/husarnet-dds
RUN chmod +x /usr/local/bin/husarnet-dds
ENV RMW_IMPLEMENTATION=rmw_fastrtps_cpp
ENV FASTRTPS_DEFAULT_PROFILES_FILE=/var/tmp/husarnet-fastdds-simple.xml

SHELL ["bash", "-c"]
CMD (husarnet-daemon & && husarnet-dds singleshot)

# Set ROS2 Humble as the default ROS Bridge
# RUN sed -i 's/# "omni.isaac.ros_bridge/"omni.isaac.ros2_bridge-humble/' /isaac-sim/apps/omni.isaac.sim.base.kit
