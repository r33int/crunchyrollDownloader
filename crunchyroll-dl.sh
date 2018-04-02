#!/bin/bash

#Some variables...
urlregex='(http://crunchyroll.com/|http://www.crunchyroll.com)[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
qualityregex='[1-3]'

function start {
	tput setaf 4; echo "Checking for youtube-dl..."
	sleep 0.2
	if ! type "youtube-dl" > /dev/null; then
		tput setaf 1;echo "youtube-dl has not been found. Please install it and relaunch this script. If you are sure you have it installed, please open an issue on GitHub. https://l.r33.space/crdlissue"
		echo Press CTRL+C to exit.
		sleep infinity
	else
		tput setaf 2;echo "youtube-dl has been found, we may continue!"
		sleep 0.1
		tput reset
		cookie
	fi
}

function quit {
	tput setaf 5;echo "Exiting. Have a great day!"
	sleep 0.5
	tput reset
	exit 1
}

function cookie {
	tput setaf 6;echo "First of all, let's identify you! If you want to use an account, please specify the path of your cookies.txt file. Not sure about what I am talking about? Check README for more details. https://l.r33.space/crdl"
	tput setaf 5;echo "If you do not want to use an account, just press enter. Please keep in mind that without an account, you will not be able to download premium-only videos and maximum quality is 480p."
	echo ""
	tput setaf 6;read -e -p "Path: " cookies
	if [ -f $cookies ]
	then
		echo ""
		tput setaf 2;echo "Yep, I found the file you specified!"
		tput reset
		download-cookie
	else
		echo ""
		tput setaf 1;echo "You seem to have not specified a cookie file. Maximum quality is 480p."
		tput reset
		download-nocookie
	fi
}

function downloadcookie {
	echo test
}

function downloadnocookie {
	echo test
}

function path {
	echo test
}

tput reset
sleep 0.2
start