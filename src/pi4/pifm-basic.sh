#!/bin/bash

# This is a small script created by MundeepL as an alternative
# to the GUI interface of PiFM, which is an FM transmitter app

clear
echo " "
echo "██████╗ ██╗    ███████╗███╗   ███╗     ██╗   ██████╗"
sleep 0.1
echo "██╔══██╗██║    ██╔════╝████╗ ████║    ███║   ╚════██╗"
sleep 0.1
echo "██████╔╝██║    █████╗  ██╔████╔██║    ╚██║    █████╔╝"
sleep 0.1
echo "██╔═══╝ ██║    ██╔══╝  ██║╚██╔╝██║     ██║   ██╔═══╝"
sleep 0.1
echo "██║     ██║    ██║     ██║ ╚═╝ ██║     ██║██╗███████╗"
sleep 0.1
echo "╚═╝     ╚═╝    ╚═╝     ╚═╝     ╚═╝     ╚═╝╚═╝╚══════╝"
echo " "
sleep 1
echo "PiFM has been produced by MundeepL"
sleep 5
clear
echo "Welcome to PiFM. An FM-RDS capable transmitter."
sleep 0.5
echo "This is a quick way to easily set up PiFM"
sleep 0.5
echo "and is designed to make the process of using Pi FM considerably easier."
sleep 0.5
echo "allowing you to start transmitting with just a few bits of key, user-customizable information"
sleep 5
clear

# Choose Frequency
echo "Which frequency would you like to use? (Pi 4 max. 93)"
read frequency
clear
# Choose PS Name
echo "Choose a Program Service name (max. 8 characters)"
read ps
clear
# Choose Radio Text
echo "Choose Radio Text"
read rt
clear
# Choose Audio File
echo "Which audio file should be transmitted? (include extension .wav .ogg)"
read audio
clear
# Choose PI-Code
echo "What PI-code would you like to use for the broadcast? (enter in hexidecimal)"
read pi
clear
# Choose Program Type
echo "Choose the program type (https://bit.ly/2Q7JqhK has a list of these)"
read pty
clear
# Choose Output Power (mpx)
echo "Now choose the mpx (default 30 - audio starts breaking at ~50)"
read mpx
clear
# Choose Output Strength
echo "Choose the power strength of the transmission. (max. 7)"
read power
clear
# Choose Pre Emphasis
echo "Choose the pre emphasis of the transmission. 'eu' or 'us'"
read pre
clear
# Cool Loading Bar - Realistically serves no purpose xD
echo -ne '[]                    []      (0%)\r'
sleep 0.1
echo -ne '[]#                   []      (5%)\r'
sleep 0.1
echo -ne '[]##                  []      (10%)\r'
sleep 0.1
echo -ne '[]###                 []      (15%)\r'
sleep 0.1
echo -ne '[]####                []      (20%)\r'
sleep 0.1
echo -ne '[]#####               []      (25%)\r'
sleep 0.1
echo -ne '[]######              []      (30%)\r'
sleep 0.1
echo -ne '[]#######             []      (35%)\r'
sleep 0.1
echo -ne '[]########            []      (40%)\r'
sleep 0.1
echo -ne '[]#########           []      (45%)\r'
sleep 0.1
echo -ne '[]##########          []      (50%)\r'
sleep 0.1
echo -ne '[]###########         []      (55%)\r'
sleep 0.1
echo -ne '[]############        []      (60%)\r'
sleep 0.1
echo -ne '[]#############       []      (65%)\r'
sleep 0.1
echo -ne '[]##############      []      (70%)\r'
sleep 0.1
echo -ne '[]###############     []      (75%)\r'
sleep 0.1
echo -ne '[]################    []      (80%)\r'
sleep 0.1
echo -ne '[]#################   []      (85%)\r'
sleep 0.1
echo -ne '[]##################  []      (90%)\r'
sleep 0.1
echo -ne '[]################### []      (95%)\r'
sleep 0.1
echo -ne '[]####################[]      (100%)\r'
sleep 1
echo -ne 'Completed. Starting service Pi FM.  \r'
echo -ne '\n'
cd $HOME/PiFM/src
sudo ./pifm --freq $frequency --ps $ps --rt "$rt" --audio $audio --pi $pi --pty $pty --mpx $mpx --power $power --preemph $pre
