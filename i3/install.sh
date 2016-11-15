#!/bin/bash

config="config"
i3status=".i3status.conf"
i3folder="${HOME}/.i3"

[[ ! -d "$i3folder" ]] && mkdir "$i3folder"

[[ -e "$i3folder/$config" ]] && mv "$i3folder/$config" "$i3folder/${config}.old"
cp "./$config" "$i3folder/."

[[ -e "${HOME}/$i3status" ]] && mv "${HOME}/$i3status" "${HOME}/${i3status}.old"
cp "$i3status" "${HOME}/$i3status"
