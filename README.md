# Drone_Competition
Autonomous Drone Simulation Competition

# PC Recommended Specifications
- Intel Core i7-10750H 10th Generation, 5.00GHz
- 16 GB DDR4 RAM
- 500 GB SSD
- NVIDIA GeForce GTX 1660 Ti

# PC Required Specifications
- OS : Ubuntu 18.04
- external graphics card

# Install Guide
0. After git clone
```
cd ~/Drone_Competition
```
1. Install Ros Melodic
```
sudo chmod +x ros_melodic_install.sh
./ros_melodic_install.sh
```
  
2. Install Unreal Engine
Make sure you are registered with Epic Games. This is required to get source code access for Unreal Engine.     
Link : https://docs.unrealengine.com/4.26/en-US/SharingAndReleasing/Linux/BeginnerLinuxDeveloper/SettingUpAnUnrealWorkflow/
```
sudo chmod +x Unreal_install.sh
./Unreal_install.sh
```

3. Install AirSim
```
sudo chmod +x AirSim_install.sh
./AirSim_install.sh
```

4. Install mavros
```
sudo chmod +x mavros_install.sh
./mavros_install.sh
```

5. Install px4
```
sudo chmod +x px4_install.sh
./px4_install.sh
```

6. Setting and Download map

Setting file for drone competition. This file is used to set visual sensors and connenct simulation with px4 firmware.
Put this file at Documents\Airsim

Visual sensor specification


front_RGB_custom

RGB, 480X320, FOV : 90

front_Depth_custom

Depth, 480X320, FOV : 90


Link : https://drive.google.com/file/d/10HfFgOXBkaS7w-cV9VT8arAf4vEFdtrW/view?usp=sharing



![전경1](https://user-images.githubusercontent.com/71123229/125734120-de1456b6-a83a-49dd-96fc-4fa7491cae9b.jpg)

Competition map

Download competition map. Download file and unzip. Run drone_proto.uproject file and click 'play' for start simulation

Link : https://drive.google.com/file/d/1fpxkDV5Y78FjcNE7m562a51CycNjB8dY/view?usp=sharing

# Launch Guider
0.
Open 4 terminals respectively

1. Airsim
```
cd ~/Airsim/ros
source devel/setup.bash
roslaunch airsim_ros_pkgs airsim_node.launch
```

2. PX4
```
cd ~/PX4-Autopilort
make px4_sitl_default none_iris
```
3. Mavros
```
roslaunch mavros px4.launch fcu_url:="udp://:14540@127.0.0.1:14557"
roslaunch mavros px4.launch fcu_url:="udp://:14540@127.0.0.1:14557"
```

4. terminal 4
```

```

# Notice

## Noise is added
[![noise](https://user-images.githubusercontent.com/71123229/125740779-4d6557b8-fab1-455e-8b05-4855421ed6f0.png)](https://youtu.be/ys-Tc5dBA5w)

noise added

[![no noise](https://user-images.githubusercontent.com/71123229/125741035-d5ee562e-b835-4e04-a8bb-9195faa8f45d.png)](https://youtu.be/BqFNKbOr144)

noise not added

## Offboard control Example
### C++ example
https://docs.px4.io/master/en/ros/mavros_offboard.html
### Python example



