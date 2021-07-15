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
Link : https://drive.google.com/file/d/1fh2EnoJz7hbem4Dgi3Q70KtUQGRDGnZq/view?usp=sharing


Download competition map. Download file and unzip. Run drone_proto.uproject file and click 'play' for start simulation
Link : https://drive.google.com/file/d/1Zefu_2-tbK14JzNXVEIFOp9buxfZr6iS/view?usp=sharing
