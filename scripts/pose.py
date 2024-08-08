#!/usr/bin/env python3

import rospy
from sobit_mini_module import SobitMiniJointController
from sobit_mini_module import Joint
import sys
import math

def main():
    rospy.init_node('sobit_mini_initial_pose')
    args = sys.argv
    mini_ctr = SobitMiniJointController(args[0]) # args[0] : Arguments for ros::init() on C++

    # Set initial pose
    mini_ctr.moveToPose( "initial_pose" )

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException: pass