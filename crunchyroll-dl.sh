#!/bin/bash

#Some variables...
urlregex='(http://crunchyroll.com/|http://www.crunchyroll.com|https://www.crunchyroll.com|https://crunchyroll.com)[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'

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
	echo ""
	tput setaf 5;echo "Exiting. Have a great day!"
	tput setaf 2;echo "Don't forget to star me on GitHub if this script helped you! https://l.r33.space/crdl"
	sleep 1
	tput reset
	exit 1
}

function cookie {
	tput setaf 6;echo "First of all, let's identify you! If you want to use an account, please specify the path of your cookies.txt file. Not sure about what I am talking about? Check README for more details. https://l.r33.space/crdl"
	tput setaf 5;echo "If you do not want to use an account, just press enter. Please keep in mind that without an account, you will not be able to download premium-only videos and maximum quality is 480p."
	echo ""
	tput setaf 6;read -r -e -p "Path: " cookies
	if [ ! -f "$cookies" ]
	then
		echo ""
		tput setaf 1;echo "You seem to have not specified a cookie file. Proceeding offline."
		sleep 0.5
		tput reset
		quality_nocookie
	else
		echo ""
		tput setaf 2;echo "Yep, I found the file you specified!"
		sleep 0.5
		tput reset
		quality_cookie
	fi
}

function quality_cookie {
	tput setaf 2;echo "Now, choose the quality you want to download."
	echo ""
	tput setaf 6;echo "1) 480p"
	echo "2) 720p"
	echo "3) 1080p"
	echo "4) Best quality possible"
	echo "5) Go back"
	echo "6) Exit"
	echo ""
	while [[ $OPTION0 !=  "1" && $OPTION0 != "2"  && $OPTION0 != "3" && $OPTION0 != "4" && $OPTION0 != "5" && $OPTION0 != "6" ]]; do
		read -r -p "Select an option [1-5]: " OPTION0
	done
	quality_cookie2 
	}

	function quality_cookie2 {
		case $OPTION0 in
		1) #480p
			quality="480"
			link
			;;
		2) #720p
			quality="720"
			link
			;;
		3) #1080p
			quality="1080"
			link
			;;
		4) #Best quality possible
			quality="best"
			link
			;;
		5) #Go back
			OPTION0=""
			tput reset
			cookie
			;;
		6) #Exit
			quit
		;;
	esac
	}


function quality_nocookie {
	tput setaf 2;echo "Now, choose the quality you want to download."
	echo ""
	tput setaf 6;echo "1) 480p"
	echo "2) Go back"
	echo "3) Exit"
	echo ""
	while [[ $OPTION1 !=  "1" && $OPTION1 != "2" && $OPTION1 != "3"  ]]; do
		read -r -p "Select an option [1-3]: " OPTION1
	done
	quality_nocookie2 
	}

	function quality_nocookie2 {
		case $OPTION1 in
		1) #480p
			quality="480"
			link
			;;
		2) #Go back
			OPTION1=""
			tput reset
			cookie
			;;
		3) #Exit
			quit
			;;
	esac
	}

function link {
	tput reset;tput setaf 6
	echo "Enter the URL of the video you want do download. If you want to download an entiere series, enter its link."
	tput setaf 5;echo "Reference URL: http://www.crunchyroll.com/laid-back-camp/episode-12-mount-fuji-and-the-laid-back-camp-girls-758807"
	tput setaf 5;echo "Reference URL (entiere series): http://www.crunchyroll.com/laid-back-camp"
	echo ""
	tput setaf 6;read -r -p "URL: " url
	if [[ $url =~ $urlregex ]]
	then
		echo ""
		tput setaf 2;echo "Seems good!"
		sleep 0.3
		path
	else
		echo ""
		tput setaf 1;echo "This link seems to be invalid. Make sure you entered a valid Crunchyroll link."
		sleep 0.8
		link
	fi
}

function link_batch {
	tput reset;tput setaf 6
	echo "Enter the URL of the video you want do download."
	tput setaf 5;echo "Reference URL: http://www.crunchyroll.com/laid-back-camp/episode-12-mount-fuji-and-the-laid-back-camp-girls-758807"
	echo ""
	tput setaf 6;read -r -p "URL: " url
	if [[ $url =~ $urlregex ]]
	then
		echo ""
		tput setaf 2;echo "Seems good!"
		sleep 0.3
		download
	else
		echo ""
		tput setaf 1;echo "This link seems to be invalid. Make sure you entered a valid Crunchyroll link."
		sleep 0.8
		download
	fi
}

function path {
	tput reset
	tput setaf 6;echo "Where do you want to save your file? Empty input will save to the script's folder."
	echo ""
	read -r -e -p "Path: " path
	tput reset
	sleep 0.2
	language
}

function language {
	tput setaf 6;echo "Choose the language you want to download subtitles for. Subtitles will be saved in a separate .ass file"
	tput setaf 1;echo "Not all languages may be available for all videos, so check availability before choosing. Please let me know if there is any missing language by opening an issue. https://l.r33.space/crdlissue"
	echo "";tput setaf 6
	echo "1) English (US)"
	echo "2) English (UK)"
	echo "3) Arabic"
	echo "4) French"
	echo "5) German"
	echo "6) Italian"
	echo "7) Portuguese (Brasil)"
	echo "8) Portuguese (Portugal)"
	echo "9) Russian"
	echo "10) Spanish"
	echo "11) Spanish (Spain)"
	echo "11) Spanish (Spain)"
	echo "12) All"
	echo "13) Go back"
	echo "14) Exit"
	echo ""
	while [[ $OPTION2 !=  "1" && $OPTION2 != "2"  && $OPTION2 != "3" && $OPTION2 != "4" && $OPTION2 != "5" && $OPTION2 != "6" && $OPTION2 != "7" && $OPTION2 != "8" && $OPTION2 != "9" && $OPTION2 != "10" && $OPTION2 != "11" && $OPTION2 != "12" && $OPTION2 != "13" && $OPTION2 != "14" ]]; do
		read -r -p "Select an option [1-14]: " OPTION2
	done
	language2
	}

	function language2 {
		case $OPTION2 in
		1) #English (US)
			language="enUS"
			download
			;;
		2) #English (UK)
			language="enGB"
			download
			;;
		3) #Arabic
			language="arME"
			download
			;;
		4) #French
			language="frFR"
			download
			;;
		5) #German
			language="deDE"
			download
			;;
		6) #Italian
			language="itIT"
			download
			;;
		7) #Portuguese (Brasil)
			language="ptBR"
			download
			;;
		8) #Portuguese (Portugal)
			language="ptPT"
			download
			;;
		9) #Russian
			language="ruRU"
			download
			;;
		10) #Spanish
			language="esLA"
			download
			;;
		11) #Spanish (Spain)
			language="esES"
			download
			;;
		12) #All
			language="all"
			download
			;;
		13) #Go back
			OPTION2=""
			tput reset
			path
			;;
		14) #Exit
			quit
			;;
	esac
	}

function download {
	tput reset
	tput setaf 2;echo "Alright, let's download your video now! youtube-dl is going to execute below. This may take some time."
	tput setaf 5;echo "If you have not logged in, you might get an error about cookies file. Ignore it."
	echo ""
	if path=""
	then
		if quality="best"
		then
			if language="all"
			then
				youtube-dl --write-sub --cookies "$cookies" "$url"
			else
				youtube-dl --write-sub --sub-lang "$language" --cookies "$cookies" "$url"
			fi
		else
			if language="all"
			then
				youtube-dl --write-sub --cookies "$cookies" -f "best[height=$quality]" "$url"
			else
				youtube-dl --write-sub --sub-lang "$language" -f "best[height=$quality]" --cookies "$cookies" "$url"
			fi
		fi
	else
		if quality="best"
		then
			if language="all"
			then
				youtube-dl "$path/%(title)s-%(id)s.%(ext)s" --write-sub --cookies "$cookies" "$url"
			else
				youtube-dl "$path/%(title)s-%(id)s.%(ext)s" --write-sub --sub-lang "$language" --cookies "$cookies" "$url"
			fi
		else
			if language="all"
			then
				youtube-dl -o "$path/%(title)s-%(id)s.%(ext)s" --write-sub --cookies "$cookies" -f "best[height=$quality]" "$url"
			else
				youtube-dl -o "$path/%(title)s-%(id)s.%(ext)s" --write-sub --sub-lang "$language" -f "best[height=$quality]" --cookies "$cookies" "$url"
			fi
		fi
	fi
	echo ""
	tput setaf 2;echo "youtube-dl command has completed. Your download should be done!"
	tput setaf 1;echo "If you have encontered any problem, please open an issue on GitHub with the full terminal log. https://l.r33.space/crdlissue"
	whattodonext
}

function whattodonext {
	echo ""
	tput setaf 5;echo "What to do next?"
	tput setaf 6;echo "1) Download another video"
	echo "2) Download another video (same settings)"
	echo "3) Exit"
	echo ""

	while [[ $OPTION3 !=  "1" && $OPTION3 != "2" && $OPTION3 != "3"  ]]; do
	read -r -p "Select an option [1-3]: " OPTION3
	done
	whattodonext2 
	}

	function whattodonext2 {
		case $OPTION3 in
		1) #Download another video
		if [ ! -f "$cookies" ]
		then
			OPTION3=""
			tput reset
			quality_nocookie
		else
			tput reset
			quality_cookie
		fi
		;;
		2) #Download another video (same settings)
			OPTION3=""
			link_batch
			;;
		3) #Exit
			quit
			;;
	esac
	}

tput reset
sleep 0.2
start
