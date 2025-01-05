#!/bin/bash

# This is a setup script for the Pi FM RDS Transmitter project streamlined by mundeepl
clear
echo "Welcome to the PiFM installer. This script will help you get up and running."
echo "PiFM currently supports: Pi 1, 2, 3, Zero. The 4 uses a different setup script (development for the Raspberry Pi 4 is under slow progress with no guaranteed completion time)."
echo "For more information, visit https://github.com/mundeepl"
echo "NOTICE! Your system will reboot once completed."
sleep 10
clear
echo "Updating repository" ; sleep 1
sudo apt-get update
echo " "
echo "Installing required tools" ; sleep 1
sudo apt-get install libsndfile1-dev zenity -y
clear
echo "Changing directory --> src" ; sleep 1
cd $HOME/PiFM/src
clear
echo "Cleaning up" ; sleep 1
make clean
echo " "
echo "Compiling" ; sleep 1
make
clear
echo "Making adjustments to --> /boot/config.txt" ; sleep 1
echo "gpu_freq=250" | sudo tee -a /boot/config.txt > /dev/null
clear
echo "Adding software" ; sleep 1
cd $HOME/PiFM
# Copy GUI Version
sudo cp $HOME/PiFM/pifm.sh /usr/local/bin
sudo mv /usr/local/bin/pifm.sh /usr/local/bin/pifm
# Copy Basic Version
sudo cp $HOME/PiFM/pifm-basic.sh /usr/local/bin
sudo mv /usr/local/bin/pifm-basic.sh /usr/local/bin/pifm-basic
clear
echo "Creating shortcuts" ; sleep 1
sudo cp $HOME/PiFM/src/PiFM.desktop $HOME/Desktop
sudo cp $HOME/PiFM/src/PiFM.desktop /usr/share/applications
echo "Changing filename/type" ; sleep 1
sudo mv $HOME/PiFM/src/pi_fm_adv $HOME/PiFM/src/pifm
clear
echo "Patching xterm" ; sleep 1
cd /usr/bin
sudo cp lxterminal xterm
clear
echo "Assigning permissions" ; sleep 1
sudo chmod +x $HOME/PiFM/pifm
sudo chmod +x /usr/local/bin/pifm
sudo chmod +x /usr/local/bin/pifm-basic
clear
echo "Completed" ; sleep 2
clear
echo "To start broadcasting, use the menu or desktop shortcuts,"
echo "or type radio into the terminal. System about to reboot..."
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
