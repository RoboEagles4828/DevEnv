FROM ultralytics/ultralytics:latest

############ Install ROS2 ############

# Set and Check Locale
RUN apt-get update || true && \
  apt-get install --no-install-recommends -y locales && \
  locale-gen en_US en_US.UTF-8 && \
  update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
  export LANG=en_US.UTF-8 && \
  locale  # verify settings && \
  rm -rf /var/lib/apt/lists/*

# Setup Sources
RUN apt-get update || true && \
  apt-get install --no-install-recommends -y software-properties-common && \
  add-apt-repository universe && \
  apt-get install -y curl && \
  curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null && \
  rm -rf /var/lib/apt/lists/*

# Use the noninteractive frontend to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Now you can run your apt-get install commands
RUN apt-get update && apt-get install -y \
    tzdata 
# Install ROS 2 Base packages and Python dependencies
RUN apt-get update || true && \
  apt-get install --no-install-recommends -y \
  ros-humble-ros-base \
  ros-humble-ament-cmake-clang-format \
  ros-humble-image-transport \
  ros-humble-image-transport-plugins \
  ros-humble-diagnostic-updater \
  ros-humble-xacro \
  python3-flake8-docstrings \
  python3-pip \
  python3-pytest-cov \
  ros-dev-tools && \
  pip3 install \
  argcomplete \
  numpy \
  empy \
  lark && \
  rm -rf /var/lib/apt/lists/*

# Initialize rosdep
RUN rosdep init && rosdep update

RUN echo 'source /opt/ros/humble/setup.bash' >> ~/.bashrc

WORKDIR /usr/local
