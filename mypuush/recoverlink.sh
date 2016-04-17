### The aim of this program is to send to the clipboard the link 
### of the last screenshot

# Installation path (CHANGEME)
INSTALL=/home/hamtarowarrior/src/mypuush/

cd $INSTALL

source $INSTALL/config

if [ ! -e $LINKFILE ]; then
    python notify.py norecover
    echo "Your link file does not exist. If it does, check the path of your tmp files"
    exit 4
fi

cd $INSTALL

LINK=`python recover.py $LINKFILE` 

if [ $LINK = 3 ]; then
    python notify.py linkfileempty
    echo "Your linkfile is empty or does not contain the right content. Go check it"
    exit 3
else
    echo $LINK
    echo $LINK | xclip -sel clip
    python notify.py success $LINK
fi
