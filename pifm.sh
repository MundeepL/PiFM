#!/bin/bash

# Initialising and setting variables to zero (these variables are used later in the code)
filecount=0
nameaccepted=0
textaccepted=0


# This is a small script created by Mundeep Lamport to streamline
# the process of running Pi FM RDS which is an FM transmitter tool.

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

# Display about
zenity --title="PiFM by mundeepl" --info --text="Welcome to the Raspberry Pi FM Transmitter with RDS. This is a small applet designed by mundeepl to easily set up Pi FM RDS and is designed to make the process of broadcasting significantly easier. Please note that the software only decodes .wav or .ogg files." --width=500 --height=150 --ok-label="Begin"

# Choose a Program Service name (advanced)
         until [  $nameaccepted == 1 ] ; do
		ps=$(zenity --title="PiFM by mundeepl" --entry --text="Choose the Program Service Name (max. 8 characters)" --entry-text="PiFM" --width=500 --height=150 --ok-label="Continue" --cancel-label="Close")
		pslength=${#ps}

		if [[ $pslength -ge 0 && $pslength -le 8 ]] ; then 
			nameaccepted=1
  			echo "Program Service name: $ps accepted"
		else
  			nameaccepted=0
  			zenity --title="PiFM Error" --error --text="The maximum length is 8 characters!" --width=200 --height=50 --ok-label="Retry"
fi
         done

# Choose the radio text (advanced)
         until [  $textaccepted == 1 ] ; do
		rt=$(zenity --title="PiFM by Mundeep Lamport" --entry --text="Choose the radio text (max. 64 characters)" --entry-text="Hello, World!" --width=500 --height=150 --ok-label="Continue" --cancel-label="Close")
		rtlength=${#rt}

		if [[ $rtlength -ge 0 && $rtlength -le 64 ]] ; then 
			textaccepted=1
  			echo "Radio Text: $rt accepted"
		else
  			textaccepted=0
  			zenity --title="PiFM Error" --error --text="The maximum length is 64 characters!" --width=200 --height=50 --ok-label="Retry"
fi
         done

# Choose a frequency
frequency=$(zenity --title="PiFM by mundeepl" --entry --text="Choose a frequency (usually 87.5 - 108.0 MHz)" --entry-text="87.6" --width=500 --height=150 --ok-label="Continue" --cancel-label="Close")
echo "The chosen frequency is $frequency MHz"

# Chooose an audio file (advanced)
         until [  $filecount == 1 ]; do
             audio=$(zenity --file-selection --title="Choose .wav or .ogg File")

	     case $? in
       		  0)
              			  filecount=1
              			  echo "The file" "\"$audio\" has been selected";;
      			  1)
             			  filecount=0
             			  zenity --title="PiFM Choose A File!" --error --text="No file selected!" --width=200 --height=50 --ok-label="Retry";;
       		 -1)
               		  zenity --title="PiFM Error!" --error --text="An unexpected error occured" --width=200 --height=50 --ok-label="Close";;
esac
         done


# Choose a region
region=$(zenity  --list  --title="PiFM by mundeepl" --text="Select current region" --radiolist --column "Pick" --column "PreEmph" --column "Region" TRUE us USA FALSE eu Europe FALSE eu Asia --ok-label="Continue" --cancel-label="Close")
echo "Region set to: $region"

# Choose the genre
genre=$(zenity  --list  --title="PiFM by mundeepl" --text="Select the broadcast genre" --radiolist --column "Pick" --column "Number" --column "Genre" TRUE 0 "Undefined" FALSE 1 "News" FALSE 2 "Current Affairs" FALSE 3 "Information" FALSE 4 "Sport" FALSE 5 "Education" FALSE 6 "Drama" FALSE 7 "Culture" FALSE 8 "Science" FALSE 9 "Varied" False 10 "Pop music" FALSE 11 "Rock music" FALSE 12 "Easy listening" FALSE 13 "Light Classical" FALSE 14 "Serious Classical" FALSE 15 "Other music" FALSE 16 "Weather" FALSE 17 "Finance" FALSE 18 "Children's programmes" FALSE 19 "Social affairs" FALSE 20 "Religion" FALSE 21 "Phone-in" FALSE 22 "Travel" FALSE 23 "Leisure" FALSE 24 "Jazz music" FALSE 25 "Country Music" FALSE 26 "National music" FALSE 27 "Oldies music" FALSE 28 "Folk music" FALSE 29 "Documentary" FALSE 30 "ALARM TEST" FALSE 31 "ALARM" --ok-label="Continue" --cancel-label="Close")
echo "Program Type: $genre" 

# Choose output power
power=$(zenity  --list  --title="PiFM by mundeepl" --radiolist --text="Select output power." --column "Pick" --column "Power" TRUE 1 FALSE 2 FALSE 3 FALSE 4 FALSE 5 FALSE 6 FALSE 7 --ok-label="Continue" --cancel-label="Close")
echo "Power set to $power"

# End notice before starting
zenity --title="PiFM by mundeepl" --info --text="Now that you have chosen your options, it is time to begin transmitting. Ensure your antenna is inserted into GPIO 4 and then click start." --ok-label="Start" --width=500 --height=150

# Cool loading bar - serves no purpose other than a pause
(
echo "Applying PS Name" ; sleep 0.5
echo "10" ; sleep 0.1
echo "Choosing Frequency" ; sleep 0.5
echo "25" ; sleep 0.1
echo "Using selected file" ; sleep 0.5
echo "30" ; sleep 0.1
echo "Checking region" ; sleep 0.5
echo "40" ; sleep 0.1
echo "Checking Genre" ; sleep 0.5
echo "70" ; sleep 0.1
echo "Setting output power" ; sleep 0.5
echo "95" ; sleep 0.1
echo "Finishing..." ; sleep 1
echo "Finished." ; sleep 0.5
echo "100"
) |
zenity --progress --title="PiFM by mundeepl" --percentage=0 --auto-close --auto-kill
(( $? != 0 )) && zenity --error --title="PiFM Error" --text="Error! Could not complete!" --width=200 --height=100
echo "Completed. Starting service Pi FM RDS"

# Running Pi FM RDS
cd $HOME/PiFM/src
sudo ./pifm --ps $ps --rt "$rt" --freq $frequency --audio $audio --preemph $region --pty $genre --power $power
zenity --title="PiFM by mundeepl" --info --text="Transmission ended. Thank you for using the PiFM Transmission software that was developed by mundeepl. If you would like to use more advanced settings, be sure to check out the README file in the $HOME/PiFM directory. This will teach you further arguements and how to use the command line." --width=500 --height=150 --ok-label="Exit"
