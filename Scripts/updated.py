import requests
import os
import re
import signal
import sys
from threading import Thread, Semaphore
import logging

max_threads = 16
semaphore = Semaphore(max_threads)

logging.basicConfig(level=logging.INFO, format='[%(asctime)s] [%(levelname)s] %(message)s')

def download_file(file_url, filename):
    logging.info(f"Downloading {file_url}...")
    response = requests.get(file_url)
    with open(filename, 'wb') as f:
        f.write(response.content)
    semaphore.release()

def download_files(url):
    response = requests.get(url)
    if response.status_code == 200:
        content = response.content.decode('utf-8')
        if 'e' in content:
            lines = content.split('\n')
            for line in lines:
                if '<a href="' in line:
                    href = line.split('"')[3]
                    if href.endswith('/'):
                        download_files(url + href)
                    elif href.endswith('.txt'):
                        file_url = url + href
                        filename = href.split('/')[-1]
                        semaphore.acquire()
                        t = Thread(target=download_file, args=(file_url, filename))
                        t.start()

def remove_header(filename):
    with open(filename, 'r') as f:
        content = f.read()
    pattern = re.compile(r'<!--ADULTSONLY-->\s*<meta http-equiv="pics-label".*?</font>', re.DOTALL)
    content = re.sub(pattern, '', content)
    with open(filename, 'w') as f:
        f.write(content)

def signal_handler(signal, frame):
    logging.warning("Interrupted")
    sys.exit(0)

if __name__ == '__main__':
    signal.signal(signal.SIGINT, signal_handler)

    logging.info("Downloading asstr.xyz")
    url = 'https://asstr.xyz/files/' 
    download_files(url)

    # Wait for all threads to finish before removing headers
    semaphore.acquire(max_threads)
    semaphore.release()

    logging.info("Removing headers from downloaded files")
    # Remove headers from all downloaded files
    for root, dirs, files in os.walk("."):
        for file in files:
            if file.endswith(".txt"):
                remove_header(os.path.join(root, file))
