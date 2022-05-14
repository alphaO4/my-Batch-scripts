#!/bin/python3 
import requests
import random
import string
import json
import sys

#This is a simple autoreporter sending dozens of reports about one prezi
#--------------------
url = 'https://prezi.com/contact/abuse/submit'
prezi_id = input('The prezi_ID to mass report: ') 
API = 'https://www.1secmail.com/api/v1/'
domainList = ['1secmail.com', '1secmail.net', '1secmail.org', 'wwjmp.com', 'esiix.com', 'xojxe.com', 'yoggm.com']
domain =random.choice(domainList)
u_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
print("Mass reporting Prezi with ID " + prezi_id)
client = requests.session()
#--------------------

client.get(url)
if 'csrfmiddlewaretoken' in client.cookies:
    csrftoken = client.cookies['csrfmiddlewaretoken']
else:
    csrftoken = client.cookies['csrftoken']

def rndm_creation():
    rndm = ''.join(random.choices(string.ascii_letters + string.digits, k=6))
    return rndm

#every time email gets called, we will get a new email
rndm = rndm_creation()
def email_creation(rndm):
    email = rndm + "@" + domain
    print("Email set!")
    print("Using email: "+email)
    return email
email = email_creation(rndm)

body = {
    'csrfmiddlewaretoken': csrftoken,
    'category':'abuse_spam',
    'prezi_link': prezi_id,
    'description':'This prezi is, to my best knowledge, just spam and does not deserve to be on this site',
    'evidence':'',
    'company_name':'',
    'company_address':'',
    'user_job_title':'',
    'user_full_name': u_name,
    'user_email': email,
    'user_phone':'',
    'user_adress':'',
    'signature':''
    }


r = client.post(url,data=body, headers=dict(Referer=url))

print(r.headers)
print(r)
print(r.text)
