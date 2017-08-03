#!/bin/bash
function jumpto
{
    label=$1
    cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
    eval "$cmd"
    exit
}

cookiesstep=${1:-"cookiesstep"}


urlregex='(http://crunchyroll.com/|http://www.crunchyroll.com)[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
qualityregex='[1-3]'

echo Checking for youtube-dl...
sleep 0.2
if ! type "youtube-dl" > /dev/null; then
  tput setaf 1;echo youtube-dl not found. Please install it and relaunch this script
  echo Press CTRL+C to exit.
  sleep infinity
else
sleep 0.5
clear
tput setaf 6;echo Welcome !
sleep 0.2
tput setaf 5;echo This is a script for downloading videos from Crunchyroll using youtube-dl.
sleep 0.2
echo Enjoy!
sleep 0.2
echo
tput setaf 2;read -e -p 'First, enter the link of the video you want to donwload : ' link

if [[ $link =~ $urlregex ]]
then 
    sleep 0.5
    clear
    PS3='Now, select the quality you want to use : '
	options=("480p" "720p" "1080p" "Exit")
	select opt in "${options[@]}"
	do
    case $opt in
        "480p")
            quality='480'
            break
            ;;
        "720p")
            quality='720'
            break
            ;;
        "1080p")
            quality='1080'        	
            break
            ;;
        "Exit")
            exit
            ;;
        *) 
			tput setaf 1;echo Invalid selection.;tput setaf 2;;
    esac
done
sleep 0.5
cookiesstep:
clear
read -e -p 'Enter the exact path of your cookies.txt file. If you are not sure what is this file, check the README.md file. : ' cookies
if [ -f $cookies ]
then
    echo Cookies file found.
    sleep 0.5
    clear
    echo 'Where do you want to save your video ? Empty input will save to default path (home folder)'
    tput setaf 1;read -e -p 'Enter path : ' output
    sleep 0.5
    clear
    tput setaf 5;echo Alright. At the moment, this script can only download english subs. The possibility to change sub language will be added very soon.
    echo Starting download...
    sleep 0.5
    tput setaf 4
    if [$output = ""]
    	then 
    	youtube-dl --write-sub --sub-lang enUS -f "best[height=$quality]" --cookies $cookies $link
   		tput setaf 2;echo youtube-dl command completed ! Download should be done.
    else
    	youtube-dl -o "$output/%(title)s-%(id)s.%(ext)s" --write-sub --sub-lang enUS -f "best[height=$quality]" --cookies $cookies $link
   		tput setaf 2;echo youtube-dl command completed ! Download should be done.
   	fi
else
    tput setaf 1 echo Cookies file not found. Please try again.
    sleep 0.5
    tput setaf 2
    jumpto cookiesstep
fi
else
	sleep 0.5
    tput setaf 1; echo "Invalid link. Make sure you entered a Crunchyroll link."
fi
fi