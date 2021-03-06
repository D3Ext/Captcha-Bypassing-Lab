# Captcha Bypassing Lab

*If you want to practice Captcha Bypassing, this is the right place!*

***\* Tested in Kali Linux, Parrot OS, Ubuntu and Arch \****

You can bypass the captcha with just 2 things:

- [python](https://www.python.org/) **(for sending the requests, using tesseract and image processing)**
- [tesseract](https://github.com/tesseract-ocr/tesseract) **(a python module for converting an image to text)**

## Requirements:
You just need to have installed php and apache2 with your package manager:

If you are using Kali, Parrot or Ubuntu:

```sh
apt install php apache2 -y
```

If you are using Arch:

```sh
pacman -S php apache
```

## Installation:

Execute the script as root or with sudo for installing automatically the captcha:

```sh
git clone https://github.com/D3Ext/Captcha-Bypassing
bash autocaptcha.sh
```

## Demo:

<img src="https://raw.githubusercontent.com/D3Ext/Captcha-Bypassing-Lab/main/images/demo.png">

*\* The captcha characters are in an image, not displayed in text \**
<img src="https://raw.githubusercontent.com/D3Ext/Captcha-Bypassing-Lab/main/images/captcha.png">


-----------------------------------------------------------------------------------

## ⚪ Extra:

You can learn more about captchas [here](https://www.anura.io/blog/captcha-and-recaptcha-how-fraudsters-bypass-it) and [here](https://book.hacktricks.xyz/pentesting-web/captcha-bypass)

#### **If you consider this project has been useful, I would really appreciate supporting me by giving this repo a star or buying me a coffee.**

## [!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/d3ext)

### Copyright © 2022, D3Ext

