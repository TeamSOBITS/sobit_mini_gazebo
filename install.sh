#!/bin/bash

echo "╔══╣ Setup: SOBIT MINI Gazebo (STARTING) ╠══╗"


# Keep track of the current directory
DIR=`pwd`
cd ..

# Download required packages
ros_packages=(
    "roboticsgroup_upatras_gazebo_plugins" \
    "realsense_gazebo_plugin"
)

for ((i = 0; i < ${#ros_packages[@]}; i++)) {
    echo "Clonning: ${ros_packages[i]}"
    git clone https://github.com/TeamSOBITS/${ros_packages[i]}.git

    # Check if install.sh exists in each package
    if [ -f ${ros_packages[i]}/install.sh ]; then
        echo "Running install.sh in ${ros_packages[i]}."
        cd ${ros_packages[i]}
        bash install.sh
        cd ..
    fi
}

# Install required packages
sudo apt-get update
sudo apt-get install -y \
    ros-${ROS_DISTRO}-gazebo-ros-pkgs \
    ros-${ROS_DISTRO}-gazebo-ros-control \
    ros-${ROS_DISTRO}-gazebo-plugins \
    ros-${ROS_DISTRO}-gazebo-ros \
    ros-${ROS_DISTRO}-gazebo-dev

# Return to the original directory
cd $DIR


echo "╚══╣ Setup: SOBIT MINI Gazebo (FINISHED) ╠══╝"
