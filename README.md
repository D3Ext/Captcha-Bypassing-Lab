# ⭕ Captcha Bypassing Lab ⭕

If you want to try Captcha Bypassing, you can practice it with my [auto-captcha](https://github.com/D3Ext/PentestDictionary/blob/main/Captcha-Bypassing/auto-captcha.sh) script, it generates automatically 
an http-server (apache2) with a simple but efective captcha. 

***\*Tested in Parrot OS\****

You can bypass the captcha with just 2 requirements:

- [python3](https://www.python.org/) **(for sending the requests and using tesseract)**
- [tesseract](https://github.com/tesseract-ocr/tesseract) **(a python3 module for converting an image to text)**

## ⭕ Installation:
Execute the script as root or with sudo for installing automatically the captcha:

    wget "https://raw.githubusercontent.com/D3Ext/Captcha-Bypassing-Lab/main/autocaptcha.sh" &> /dev/null ; chmod +x autocaptcha.sh ; ./autocaptcha.sh
    
## ⭕ Demo:

<img src="">

### ⚪ Extra:

You can learn more about captchas [here](https://www.anura.io/blog/captcha-and-recaptcha-how-fraudsters-bypass-it) and [here](https://book.hacktricks.xyz/pentesting-web/captcha-bypass)

⚪ *Created by ***D3Ext****
