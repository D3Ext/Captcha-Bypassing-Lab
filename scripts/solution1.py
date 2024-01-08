#!/usr/bin/python3

import requests, time, os, re, signal, pytesseract, colorama, sys
from colorama import Fore
from PIL import Image

def def_handler(sig, frame):
    print("\n\n[!] Exiting...")
    sys.exit(1)

def GetCaptcha(base_url):
    loop = 0
    while loop == 0:
        try:
            # Create a session for multiple requests
            s = requests.session()

            print(Fore.MAGENTA + "[*]" + Fore.WHITE + " Obtaining captcha image url...")
            response = s.get(base_url) # Send request
            captcha_expression = re.search(r'\d{5,10}', response.text) # Use regex to filter for captcha rand url number
            image_url = base_url.removesuffix("lab1.php") + "captcha.php?rand=" + captcha_expression.group(0) # Build captcha image url

            print(Fore.GREEN + "[+]" + Fore.WHITE + " Image url: " + image_url)
            captcha_image = s.get(image_url) # Send request to image

            # Save captcha image in a file
            f = open("captcha.jpg", "wb")
            f.write(captcha_image.content)
            f.close()
            time.sleep(0.2)

            print(Fore.MAGENTA + "[*]" + Fore.WHITE + " Converting captcha image to text...")
            # Use pytesseract to parse image
            captcha_value = pytesseract.image_to_string(Image.open('captcha.jpg')).strip()
            os.remove("captcha.jpg")

            print(Fore.GREEN + "[+]" + Fore.WHITE + " Captcha value: %s" % captcha_value)
            time.sleep(0.2)

            print(Fore.MAGENTA + "[*]" + Fore.WHITE + " Checking if captcha is valid...")
            post_data = {
                'captcha': '%s' % (captcha_value),
                'submit': 'Submit'
            }

            r2 = s.post(base_url, data=post_data)

            if "captcha code is correct" in r2.text:
                print(Fore.GREEN + "\n[+]" + Fore.WHITE + " Captcha entered succesfully")
                loop = 1
            else:
                print(Fore.RED + "\n[-]" + Fore.WHITE + " Captcha entered incorrectly\n")
        except Exception as e:
            print(e)
            sys.exit(1)

if __name__ == '__main__':
    if len(sys.argv) >= 2:
        base_url = sys.argv[1]
        GetCaptcha(base_url)
    else:
        print("Usage: python3 solution1.py http://127.0.0.1/lab1.php")
        sys.exit(0)

