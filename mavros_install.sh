cd
sudo apt-get install ros-melodic-mavros ros-melodic-mavros-extras
wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
sudo bash ./install_geographiclib_datasets.sh

mkdir -p ~/rise_ws/src
cd ~/rise_ws
catkin init
wstool init src
echo "source ~/rise_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt-get install python-catkin-tools python-rosinstall-generator -y
wstool init ~/rise_ws/src


rosinstall_generator --rosdistro melodic mavlink | tee /tmp/mavros.rosinstall

rosinstall_generator --upstream mavros | tee -a /tmp/mavros.rosinstall

wstool merge -t src /tmp/mavros.rosinstall
wstool update -t src -j4
rosdep install --from-paths src --ignore-src -y

./src/mavros/mavros/scripts/install_geographiclib_datasets.sh

catkin build
source ~/.bashrc
