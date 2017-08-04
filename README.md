# crunchyrollDownloader

### What is this ?
Crunchyroll is an American distributor, publisher, licensing company and international online community focused on video streaming East Asian media including anime, manga, drama, music, electronic entertainment, and content.
_definition from wikipedia._

This script downloads anime videos from Crunchyroll using youtube-dl.

### Requirements :
1. Any Linux distribution. Other unix systems untested but should work.
2. youtube-dl installed.
3. A Crunchyroll account. You can use a free account but will only allow downloads up to 480p and premium episodes won't work.
4. A working brain.
 
#### How does it work ?
First, clone this repository. You can do that from GitHub web interface or with the command :
`git clone https://github.com/r33int/crunchyrollDownloader.git`

Then, make the script executable using
`chmod +x crunchyroll-dl.sh`

Finally, execute it and follow the instructions.
`./crunchyroll-dl.sh`

### About cookies

To authentificate to Crunchyroll, you will need a cookies.txt file. To extract this file, download this Chrome extension : https://chrome.google.com/webstore/detail/cookiestxt/njabckikapfpffapmjgojcnbfjonfjfg?hl=fr

Once installed, go to crunchyroll.com, login if that's not already done (don't forget to tick "Stay logged in"), then click on the extensions's icon, and click download.

![](https://r33int.pw/pic/crdl.jpg)

Finally, your cookies.txt file is ready.
