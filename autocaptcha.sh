#!/bin/bash

# Colors
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Ctrl + C

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n\n${redColour}[ ${endColour}${yellowColour}!${endColour}${redColour} ] Exiting...${endColour}\n"
	rm /var/www/html/captcha.php /var/www/html/index.php /var/www/html/monofont.ttf &>/dev/null
	mv /var/www/html/backupfolder/* /var/www/html/ &>/dev/null
	echo -e "${redColour}[ ${endColour}${yellowColour}!${endColour}${redColour} ] Removing captcha files...${endColour}\n"
	rm -rf /var/www/html/backupfolder/ &>/dev/null
	service apache2 stop &>/dev/null
	tput cnorm
	exit 0
}

if [ $(id -u) == "0" ]; then
	tput civis
	echo -e "\n${blueColour}[ ${endColour}${yellowColour}*${endColour}${blueColour} ] Preparing the captcha for working properly...${endColour}"
	apt install tesseract-ocr libtesseract-dev -y &>/dev/null
	apt install php7.4-gd -y &>/dev/null
	apt install apache2 -y &>/dev/null
	pip install tesseract &>/dev/null
	mkdir /var/www/html/backupfolder/ &>/dev/null
	mv /var/www/html/* /var/www/html/backupfolder/ &>/dev/null
	cd /var/www/ &>/dev/null
	chown www-data:www-data -R html &>/dev/null
	cd /var/www/html/ &>/dev/null
	curl -s -X GET https://www.allphptricks.com/demo/2018/may/create-simple-captcha-script/monofont.ttf -o monofont.ttf &>/dev/null
	wget "https://raw.githubusercontent.com/D3Ext/PentestDictionary/main/Captcha-Bypassing/config/captcha.php" &>/dev/null
	wget "https://raw.githubusercontent.com/D3Ext/PentestDictionary/main/Captcha-Bypassing/config/index.php" &>/dev/null
	wget "https://raw.githubusercontent.com/D3Ext/PentestDictionary/main/Captcha-Bypassing/config/login.php" &>/dev/null
	service apache2 start
	echo -e "\n${blueColour}[ ${endColour}${yellowColour}*${endColour}${blueColour} ] Starting service for testing captcha bypassing...${endColour}"
	sleep 1
	echo -e "\n${blueColour}[ ${endColour}${yellowColour}*${endColour}${blueColour} ] Captcha mounted at http://127.0.0.1:80${endColour}"
	sleep 0.7
	echo -e "\n${blueColour}[ ${endColour}${yellowColour}*${endColour}${blueColour} ] You can also practice it with user and password in /login.php ${endColour}"
	echo -e "\n${blueColour}[ ${endColour}${yellowColour}*${endColour}${blueColour} ] The default credentials are admin:america ${endColour}"
	sleep 0.2
	spinner=('|' '/' '-' '\')
	echo -e "\n"
	while true; do
        	for i in "${spinner[@]}"; do
                	echo -ne "${blueColour}\r[${endColour}""${yellowColour} $i ${endColour}""${blueColour}] Press Ctrl + C to stop the service${endColour}"
                	sleep 0.1
        	done
	done
else
	echo -e "\n\n${redColour}[ ${endColour}${yellowColour}!${endColour}${redColour} ] Execute the script as root${endColour}\n"
	exit 1
fi
