#!/bin/bash

# This is a setup script for the Pi FM RDS Transmitter project streamlined by Mundeep Lamport
clear
echo "Welcome to the PiFM installer. This script will help you get up and running."
echo "This script is designed specifically for the Raspberry Pi 4."
echo "For more information, visit https://github.com/mundeeplamport"
echo "WARNING! Your system will reboot once completed."
sleep 10
clear
echo "Updating repository" ; sleep 1
sudo apt-get update
echo " "
echo "Installing required tools" ; sleep 1
sudo apt-get install libsndfile1-dev zenity git -y
clear
echo "Changing directory --> src" ; sleep 1
username=$(whoami)
cd /home/$username/PiFM/src
clear
echo "Cleaning up" ; sleep 1
make clean
echo " "
echo "Compiling" ; sleep 1
make GPIO21=1
clear
echo "Changing CPU Governor"
echo "performance"| sudo tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "Editing -> /boot/config.txt" ; sleep 1
echo "gpu_freq=250" | sudo tee -a /boot/config.txt > /dev/null
clear
echo "Adding software" ; sleep 1
cd /home/$username/PiFM
# Copy GUI Version
sudo cp /home/$username/PiFM/src/pi4/pifm.sh /usr/local/bin
sudo mv /usr/local/bin/pifm.sh /usr/local/bin/pifm
# Copy Basic Version
sudo cp /home/$username/PiFM/src/pi4/pifm-basic.sh /usr/local/bin
sudo mv /usr/local/bin/pifm-basic.sh /usr/local/bin/pifm-basic
clear
echo "Creating shortcuts" ; sleep 1
sudo cp /home/$username/PiFM/src/pi4/PiFM.desktop /home/$username/Desktop
sudo cp /home/$username/PiFM/src/pi4/PiFM.desktop /usr/share/applications
echo "Changing filename/type" ; sleep 0.1
sudo mv /home/$username/PiFM/src/pi_fm_adv /home/$username/PiFM/src/pifm
clear
echo "Patching xterm" ; sleep 0.1
cd /usr/bin
sudo cp lxterminal xterm
clear
echo "Assigning permissions" ; sleep 0.1
sudo chmod +x /home/$username/PiFM/pifm
sudo chmod +x /usr/local/bin/pifm
sudo chmod +x /usr/local/bin/pifm-basic
clear
if [ $username != "pi" ]; then
  sed -i "s|/pi/|/$username/|" /home/$username/Desktop/PiFM.desktop
fi
echo "Completed" ; sleep 2
clear
echo "To start broadcasting, use the start menu/desktop shortcuts,"
echo "or type radio into the terminal. Preparing reboot..."
sleep 5
echo -ne 'Rebooting in 5\r'
sleep 1
echo -ne 'Rebooting in 4\r'
sleep 1
echo -ne 'Rebooting in 3\r'
sleep 1
echo -ne 'Rebooting in 2\r'
sleep 1
echo -ne 'Rebooting in 1\r'
sleep 1
echo -ne 'Rebooting now \r'
sudo reboot
