#!/bin/bash

greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n\n${blueColour}[ ${endColour}${yellowColour}!${endColour}${blueColour} ] Exiting...${endColour}\n"
	rm $web_path/captcha.php $web_path/index.php $web_path/login.php $web_path/monofont.ttf &>/dev/null
	mv $web_path/backupfolder/* $web_path/ &>/dev/null
	echo -e "${blueColour}[ ${endColour}${yellowColour}!${endColour}${blueColour} ] Removing captcha files...${endColour}\n"
	rm -rf $web_path/backupfolder &>/dev/null
	stop_server
}

function stop_server(){
        if [ "$system"  == "Parrot" ]; then
                echo -e "\n${blueColour}[ ${endColour}${yellowColour}!${endColour}${blueColour} ] Stoping apache2 service...${endColour}\n"
        	service apache2 stop
		exit 0
	fi
        if [ "$system"  == "Kali" ]; then
                echo -e "\n${blueColour}[ ${endColour}${yellowColour}!${endColour}${blueColour} ] Stoping apache2 service...${endColour}\n"
        	service apache2 stop
		exit 0
	fi
        if [ "$system"  == "Arch" ]; then
                echo -e "\n${blueColour}[ ${endColour}${yellowColour}!${endColour}${blueColour} ] Stoping php server...${endColour}\n"
		sleep 0.2
        	exit 0
	fi
        if [ "$system"  == "Ubuntu" ]; then
                echo -e "\n${blueColour}[ ${endColour}${yellowColour}!${endColour}${blueColour} ] Stoping apache service...${endColour}\n"
        	service apache2 stop
		exit 0
	fi
}

function start_server(){
        if [ "$system"  == "Parrot" ]; then
                service apache2 start
        fi

        if [ "$system"  == "Kali" ]; then
                service apache2 start
        fi

        if [ "$system"  == "Arch" ]; then
                php -S 0.0.0.0:80 &>/dev/null
        fi

        if [ "$system"  == "Ubuntu" ]; then
		service apache2 start
        fi
}

function check_os(){
	system=$(cat /etc/os-release | grep '^NAME=' | awk '{print $1}' FS=' ' | awk '{print $2}' FS='"')
	if [ "$system"  == "Parrot" ]; then
		web_path="/var/www/html"
	fi

	if [ "$system"  == "Kali" ]; then
		web_path="/var/www/html"
	fi

	if [ "$system"  == "Arch" ]; then
		web_path="/var/www/html"
	fi

	if [ "$system"  == "Ubuntu" ]; then
		web_path="/var/www/html"
	fi
}

if [ $(id -u) == "0" ]; then
	check_os
	if [ "$system" != "Arch" ]; then
		echo -e "\n${blueColour}[ ${endColour}${yellowColour}*${endColour}${blueColour} ] Preparing the captcha for working properly...${endColour}"
		mkdir $web_path &>/dev/null
		mkdir $web_path/backupfolder/ &>/dev/null
		mv $web_path/* $web_path/backupfolder/ &>/dev/null
		cd $web_path/ &>/dev/null
		wget "https://raw.githubusercontent.com/D3Ext/Captcha-Bypassing-Lab/main/template/captcha.php" &>/dev/null
		wget "https://raw.githubusercontent.com/D3Ext/Captcha-Bypassing-Lab/main/template/index.php" &>/dev/null
		wget "https://raw.githubusercontent.com/D3Ext/Captcha-Bypassing-Lab/main/template/login.php" &>/dev/null
		echo -e "\n${blueColour}[${endColour}${yellowColour} *${endColour}${blueColour} ] Download https://github.com/D3Ext/Captcha-Bypassing-Lab/blob/main/template/monofont.ttf?raw=true and move it to /var/www/html/"
		start_server
		echo -e "\n${blueColour}[ ${endColour}${yellowColour}*${endColour}${blueColour} ] Starting service for testing captcha bypassing...${endColour}"
		sleep 0.2
		echo -e "\n${blueColour}[ ${endColour}${yellowColour}*${endColour}${blueColour} ] Captcha mounted at http://127.0.0.1:80${endColour}"
		sleep 0.2
		echo -e "\n${blueColour}[ ${endColour}${yellowColour}*${endColour}${blueColour} ] You can also practice it with user and password in /login.php ${endColour}"
		sleep 0.2
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
		echo -e "\n${blueColour}[ ${endColour}${yellowColour}*${endColour}${blueColour} ] Preparing the captcha for working properly...${endColour}"
		mkdir $web_path &>/dev/null
		mkdir $web_path/backupfolder/ &>/dev/null
		mv $web_path/* $web_path/backupfolder/ &>/dev/null
		cd $web_path/ &>/dev/null
		wget "https://raw.githubusercontent.com/D3Ext/Captcha-Bypassing-Lab/main/template/captcha.php" &>/dev/null
		wget "https://raw.githubusercontent.com/D3Ext/Captcha-Bypassing-Lab/main/template/index.php" &>/dev/null
		wget "https://raw.githubusercontent.com/D3Ext/Captcha-Bypassing-Lab/main/template/login.php" &>/dev/null
		echo -e "\n${blueColour}[ ${endColour}${yellowColour}*${endColour}${blueColour} ] Starting service for testing captcha bypassing...${endColour}"
		sleep 0.2
		echo -e "\n${blueColour}[${endColour}${yellowColour} *${endColour}${blueColour} ] Download https://github.com/D3Ext/Captcha-Bypassing-Lab/blob/main/template/monofont.ttf?raw=true and move it to /var/www/html/"
		sleep 0.2
		echo -e "\n${blueColour}[ ${endColour}${yellowColour}*${endColour}${blueColour} ] You can also practice with user and password in /login.php ${endColour}"
		sleep 0.2
		echo -e "\n${blueColour}[ ${endColour}${yellowColour}*${endColour}${blueColour} ] The default credentials are admin:america ${endColour}"
		echo -e "\n${blueColour}[ ${endColour}${yellowColour}*${endColour}${blueColour} ] Captcha mounted at http://127.0.0.1:80${endColour}"
		sleep 0.2
		echo -e "\n${blueColour}[ ${endColour}${greenColour}+${endColour}${blueColour} ] Press Ctrl + C to stop the service${endColour}"
		start_server
	fi
else
	echo -e "\n\n${blueColour}[ ${endColour}${yellowColour}!${endColour}${blueColour} ] Execute the script as root${endColour}\n"
	exit 1
fi
