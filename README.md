# ⭕ Captcha Bypassing Lab ⭕

If you want to practice Captcha Bypassing, you can do it with my [autocaptcha](https://raw.githubusercontent.com/D3Ext/Captcha-Bypassing-Lab/main/autocaptcha.sh) script, it generates automatically 
an http-server (apache2) with a simple but efective captcha. 

***\* Tested in Kali Linux, Parrot Os, Ubuntu and Arch \****

You can bypass the captcha with just 2 things:

- [python](https://www.python.org/) **(for sending the requests, using tesseract and image processing)**
- [tesseract](https://github.com/tesseract-ocr/tesseract) **(a python module for converting an image to text)**

## ⭕ Requirements:
You just need to have installed php and apache2 with your package manager:

If you are using Kali, Parrot or Ubuntu:

    apt install php apache2 -y
If you are using Arch:

    pacman -S php apache

## ⭕ Installation:

Execute the script as root or with sudo for installing automatically the captcha:

    wget https://raw.githubusercontent.com/D3Ext/Captcha-Bypassing-Lab/main/autocaptcha.sh
    chmod +x autocaptcha.sh
    ./autocaptcha.sh
    
## ⭕ Demo:

<img src="https://raw.githubusercontent.com/D3Ext/Captcha-Bypassing-Lab/main/images/demo.png">

<img src="https://raw.githubusercontent.com/D3Ext/Captcha-Bypassing-Lab/main/images/captcha.png">

-----------------------------------------------------------------------------------

### ⚪ Extra:

You can learn more about captchas [here](https://www.anura.io/blog/captcha-and-recaptcha-how-fraudsters-bypass-it) and [here](https://book.hacktricks.xyz/pentesting-web/captcha-bypass)

⚪ *Created by ***D3Ext****
