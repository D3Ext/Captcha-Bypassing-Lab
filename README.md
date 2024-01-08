# Captcha Bypassing Lab

If you want to practise captcha bypassing, this is the right place!

## Introduction

This repo contains a lab to practise captcha bypassing and a python script which is already able to "break" the captcha and get the numbers of it. The lab has 2 parts, one to simply parse the captcha and the other one to combine the captcha with a simple login form

## Requirements

To use the python script you need to have install the python ***pytesseract*** package as well as the ***tesseract*** command. Both of them used to convert images to text:

To launch the lab you just need a php server and in order to generate the captcha you need to have installed php-gd and to have it enabled on `/etc/php/php.ini` by uncommenting the line `extension=gd`

## Installation

Clone the repo and set up a php server on the lab folder

```sh
git clone https://github.com/D3Ext/Captcha-Bypassing-Lab
cd Captcha-Bypassing-Lab/template
php -S 0.0.0.0:80
```

## Solution

In order to solve both labs the project has, there actually are infinite solutions but feel free to check the python scripts on the `scripts/` folder, `solution1.py` for the first part and `solution2.py` for the second one

## Demo

<img src="https://raw.githubusercontent.com/D3Ext/Captcha-Bypassing-Lab/main/images/demo1.png">

<img src="https://raw.githubusercontent.com/D3Ext/Captcha-Bypassing-Lab/main/images/demo2.png">

<img src="https://raw.githubusercontent.com/D3Ext/Captcha-Bypassing-Lab/main/images/demo3.png">

<img src="https://raw.githubusercontent.com/D3Ext/Captcha-Bypassing-Lab/main/images/demo4.png">

## References

```
https://www.anura.io/blog/captcha-and-recaptcha-how-fraudsters-bypass-it
https://book.hacktricks.xyz/pentesting-web/captcha-bypass
```

## License

This project is under MIT license

Copyright © 2024, *D3Ext*

