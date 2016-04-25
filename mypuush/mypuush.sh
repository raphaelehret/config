### The aim of this program is to reproduce a puush-like system.
### All the images will be uploaded via Imgur
### The options are the same as gnome-screenshots

# Installation path
INSTALL=/home/hamtarowarrior/src/mypuush/

cd $INSTALL

source $INSTALL/config

function notif(){
i3-nagbar -t "$1" -m "$2" &
sleep 5
[[ $1 = warning ]] && killall -9 i3-nagbar
}

for arg in $@; do
    if [ $arg = '-f' ]; then
        echo "Warning : BE CAREFUL!!! The -f option may interfer with mypuush. You got almost no change to get this to work by using this option"
    fi
    if [ $arg = '-k' ]; then
        KEEP=true
    else
        ARGS="$ARGS $arg"
    fi
done

if [ ! -d "$TMP" ]; then
    mkdir $TMP
fi

echo 'Taking screenshot'
gnome-screenshot $ARGS -f $FILE

if [ ! -e $FILE ]; then
    notif "error" "MyPuush : Could not find the screenshot file" &
    exit -1
else
    echo 'Done!'
fi

echo 'Uploading image'
LINK="$(python mypuush.py $FILE $NAME)"

if [ $KEEP = true ]; then
    if [ ! -e $SAVEFOLDER ]; then
        echo "Warning : your savefolder is incorrect, mypuush can not save your image"
    else
        cp $FILE $SAVEPATH
    fi
fi
rm $FILE


if [ -z "$LINK" ]; then
    notif "error" "MyPuush : Couldn't not find the link" &
    exit 5
elif [ $LINK = 1 ]; then
    notif "error" "MyPuush : Couldn't connect to Imgur's API" &
    exit 1
elif [ $LINK = 2 ]; then
    notif "error" "MyPuush : The upload failed" &
    exit 2
else
    echo 'Done!'
    echo "$NAME : $LINK" >> $LINKFILE
    notif "warning" "MyPuush : Your link is inclip at the address : '$LINK'" &
    { hash xclip > /dev/null && echo $LINK | xclip -sel clip && echo "Your link has also been clipboarded!"; } || { echo "If you want to your link clipboarded, install xclip"; } 
    exit 0
fi
