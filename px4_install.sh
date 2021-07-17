cd
git clone https://github.com/PX4/PX4-Autopilot.git
git checkout v1.10.1

cd PX4-Autopilot/src/lib/mixer
rm mixer_multirotor.cpp
git clone https://github.com/rladntjd/px4_noise_multirotormixer.git
mv px4_noise_multirotormixer/mixer_multirotor.cpp mixer_multirotor.cpp
rm -r -f px4_noise_multirotormixer
cd PX4-Autopilot
bash /Tools/setup/ubuntu.sh
