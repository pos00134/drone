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
## 0. After git clone
```
cd ~/Drone_Competition
``` 

## 1. Install Ros Melodic  

```
sudo chmod +x ros_melodic_install.sh
./ros_melodic_install.sh
```  

## 2. Install Unreal Engine  

Make sure you are registered with Epic Games. This is required to get source code access for Unreal Engine.  

* Just follow the "1 - Required Setup process" on [Link](https://docs.unrealengine.com/4.26/en-US/SharingAndReleasing/Linux/BeginnerLinuxDeveloper/SettingUpAnUnrealWorkflow/) to register git.  
* Don't download Git of Unreal Engine. it is included in the code that we distribute.  

```
sudo chmod +x Unreal_install.sh
./Unreal_install.sh
```  

* you’ll see a box asking to register Unreal Engine file types. You want to select “Yes”.  

And you have to install Graphics Card Driver. please refer to [Link](https://docs.unrealengine.com/4.26/en-US/Basics/InstallingUnrealEngine/RecommendedSpecifications/).  

## 3. Install AirSim  

```
sudo chmod +x AirSim_install.sh
./AirSim_install.sh
```

## 4. Install mavros  
 
```
sudo chmod +x mavros_install.sh
./mavros_install.sh
``` 

## 5. Install px4   

```
sudo chmod +x px4_install.sh
./px4_install.sh
```

## 6. Setting and Download map  

Setting file for drone competition. This file is used to set visual sensors and connenct simulation with px4 firmware.
Put this file at Documents\Airsim

Visual sensor specification


front_RGB_custom

RGB, 480X320, FOV : 90, 0.5m above from the drone center

front_Depth_custom

Depth, 480X320, FOV : 90, 0.5m above from the drone center


Link : https://drive.google.com/file/d/1SslND29AajkYmXhOygzofjK_ZB8YOdB5/view?usp=sharing



![전경1](https://user-images.githubusercontent.com/71123229/125734120-de1456b6-a83a-49dd-96fc-4fa7491cae9b.jpg)

Competition map

Download competition map. Download file and unzip. Run drone_proto.uproject file and click 'play' for start simulation

Link : https://drive.google.com/file/d/1fpxkDV5Y78FjcNE7m562a51CycNjB8dY/view?usp=sharing

  
# Launch Guide  

## 1. Open Map  
Run drone_proto.uproject file and click 'play' for start simulation.  


## 2. Open 4 terminals respectively
### 1) terminal 1 : Airsim  

```
cd ~/AirSim/ros
source devel/setup.bash
roslaunch airsim_ros_pkgs airsim_node.launch
```

### 2) terminal 2 : PX4
```
cd ~/PX4-Autopilot
make px4_sitl_default none_iris
```
### 3) terminal 3 : Mavros
```
roslaunch mavros px4.launch fcu_url:="udp://:14540@127.0.0.1:14557"
```  
if the upper code doesn't work, try this code.  

```
roslaunch mavros px4.launch fcu_url:="udp://:14550@127.0.0.1:14557"
```  

### 4) terminal 4 : Autonomous Driving (your code!)  
You have to design this part. 
```
roslaunch {your_simulation_package_name} {your_launch_file_name}.launch
```  
Please refer to the notice below. You can see Camera Intrinsic Parameter on Airsim, Subscriber & Publisher and Offboard control Example.

# Notice

## Noise is added
[![noise](https://user-images.githubusercontent.com/71123229/125740779-4d6557b8-fab1-455e-8b05-4855421ed6f0.png)](https://youtu.be/ys-Tc5dBA5w)

noise added

[![no noise](https://user-images.githubusercontent.com/71123229/125741035-d5ee562e-b835-4e04-a8bb-9195faa8f45d.png)](https://youtu.be/BqFNKbOr144)

noise not added

## Camera Intrinsic Parameter on Airsim

{ fx, fy, cx, cy } = { 240, 240, 240, 160 }

No distortion Parameter


## Subscriber & Publisher
http://wiki.ros.org/mavros

Topics mentioned at 6.13 setpoint_accel ~6.17 setpoint_velocity is provided.
(mavros_msgs/GlobalPositionTarget is EXCLUDED)


https://microsoft.github.io/AirSim/airsim_ros_pkgs.html#using-airsim-ros-wrapper

Given topics
```
/airsim_node/drone_1/front_center_custom/Scene
/airsim_node/drone_1/front_center_custom/Depthplanar
```

## Offboard control Example
### C++ example
https://docs.px4.io/master/en/ros/mavros_offboard.html
### Python example
https://github.com/rladntjd/offboard_example_python.git



