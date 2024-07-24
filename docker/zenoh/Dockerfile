# FROM ros:jazzy-ros-base

# RUN mkdir ~/ws_rmw_zenoh/src -p && cd ~/ws_rmw_zenoh/src
# RUN git clone https://github.com/ros2/rmw_zenoh.git
# RUN cd ~/ws_rmw_zenoh
# RUN rosdep install --from-paths src --ignore-src --rosdistro jazzy -y
# RUN source /opt/ros/jazzy/setup.bash
# RUN colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release

# FROM ros:jazzy-ros-base

# RUN apt-get update && \
#     apt-get install -y curl && \
#     curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
#     . $HOME/.cargo/env

# RUN mkdir -p ~/ws_rmw_zenoh/src && \
#     cd ~/ws_rmw_zenoh/src && \
#     git clone https://github.com/ros2/rmw_zenoh.git

# RUN cd ~/ws_rmw_zenoh && \
#     rosdep install --from-paths src --ignore-src --rosdistro jazzy -y && \
#     . /opt/ros/jazzy/setup.sh && \
#     colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release

FROM ghcr.io/gold-rush-robotics/rmw-zenoh:latest

