import sys
from imgurpython import ImgurClient
import configparser
from datetime import datetime

# Path to your Imgur credentials file
inipath = '/home/hamtarowarrior/src/mypuush/credentials.ini'

def get_client():
    config = configparser.ConfigParser()
    config.read(inipath)
    client_id = config.get('credentials','client_id') 
    client_secret = config.get('credentials','client_secret') 
    try:
        client = ImgurClient(client_id, client_secret)
    except:
        return 1
    return client


### This function is extracted for Imgur's API examples for Python
### Unfortunatly, I won't keep the kitten examples.
### I know you love kitten, here you go : http://imgur.com/g2ECgwb

def upload(client,filepath,name):

    # Here's the metadata for the upload. All of these are optional, including
    # this config dict itself.
    config = {
        'name':  name,
        'title': name,
        'description': 'Uploaded at {0}'.format(datetime.now())
    }

    try:
        image = client.upload_from_path(filepath, config=config, anon=False)
    except:
        return 2

    return image['link']


inputs = sys.argv
client = get_client()
if client == 1:
    print(1)
    exit(1)
imagelink = upload(client,inputs[1],inputs[2])
if imagelink == 2:
    print(2)
    exit(2)
print(imagelink)

