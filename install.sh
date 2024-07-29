#!/bin/bash

echo "╔══╣ Setup: SOBIT MINI GAZEBO (STARTING) ╠══╗"


# Keep track of the current directory
DIR=`pwd`
cd ..

# git cloneしたいTeamSOBITSのROSパッケージを以下に記述
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

sudo apt-get install -y \
    ros-${ROS_DISTRO}-turtlebot3-gazebo

echo "╚══╣ Setup: SOBIT MINI GAZEBO (FINISHED) ╠══╝"
