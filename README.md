# Drone_Competition
Autonomous Drone Simulation Competition

# PC Recommended Specifications
- Intel Core i7-10750H 10th Generation, 5.00GHz or higher
- 16 GB DDR4 RAM or higher
- 500 GB SSD or higher
- NVIDIA GeForce GTX 1660 Ti or higher

# PC Required Specifications
- OS : Ubuntu 18.04
- external graphics card is necessary

# Install Guide
## Download
```
git clone https://github.com/rladntjd/Drone_Competition.git
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


## 6. Install depth_noise

Just double-click ros-melodic-depth-noise_2.0.0-0bionic.amd64.deb

or 
```
sudo depkg -i ros-melodic-depth-noise_2.0.0-0bionic.amd64.deb
```
## 7. Setting and Download map  

* Setting file for drone competition.

This file is used to set visual sensors and connenct simulation with px4 firmware.
Put this file at Documents\Airsim

* Visual sensor specification

front_center_custom

RGB, 480X320, FOV : 90, 0.5m above from the drone center

Depth, 480X320, FOV : 90, 0.5m above from the drone center


Link : https://drive.google.com/file/d/1SslND29AajkYmXhOygzofjK_ZB8YOdB5/view?usp=sharing

* Competition map

![메시](https://user-images.githubusercontent.com/71123229/126067216-e9c53062-49d4-4abf-aa73-8f6194c59800.JPG)

Link : https://drive.google.com/file/d/1c7pa6vY1B-qt-kkSYSXheJH0W_7Aott0/view?usp=sharing

* Download file and unzip. After unzip this file, need to transfer AirSim plugin folder to unreal project plugin folder. AirSim plugin located at AirSim\Unreal\Plugins and it need to transfer to map\Plugins

* Need to turn off 'Use Less CPU when in Background' option at Edit - Editor preferences - General - Performance

# Start Guide  

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

### 4) terminal 4 : Depth Noise
```
roslaunch depth_noise depth_simple.launch
```  

# Notice

## Noise is added

Due to gaussian random noise is added to rotor thrust the drone will vibrate.

[![noise](https://user-images.githubusercontent.com/71123229/125740779-4d6557b8-fab1-455e-8b05-4855421ed6f0.png)](https://youtu.be/ys-Tc5dBA5w)

gaussian noise added

[![no noise](https://user-images.githubusercontent.com/71123229/125741035-d5ee562e-b835-4e04-a8bb-9195faa8f45d.png)](https://youtu.be/BqFNKbOr144)

noise not added

## Camera Intrinsic Parameter on Airsim

{ fx, fy, cx, cy } = { 240, 240, 240, 160 }

No distortion Parameter


## Subscriber & Publisher

https://microsoft.github.io/AirSim/airsim_ros_pkgs.html#using-airsim-ros-wrapper

Given topics

RGB image topic from Simulation Drone
```
/airsim_node/drone_1/front_center_custom/Scene
```
Depth image topic from Simulation Drone
```
/simulation/depth_image
```

Depth camera can measure distance upto 13m. Depth noise is added

http://wiki.ros.org/mavros

- /mavros/home_position/home Topic will be provided for Home Positioning

- Positioning data such as GPS is NOT provided. Use visual odometry or other pose estimation algorithm.


## Information about map

### Bird's-eye view of map
![map](https://user-images.githubusercontent.com/71123229/126273314-7f74110b-a5d9-4eab-9e14-c7f0f46e7169.png)

### Information about gates
![gate](https://user-images.githubusercontent.com/71123229/126273296-5727e07c-6f2a-4345-af75-bb5cf695aaf8.png)

## PX4 Offboard control Example
### C++ example
https://docs.px4.io/master/en/ros/mavros_offboard.html
### Python example
https://github.com/rladntjd/offboard_example_python.git



