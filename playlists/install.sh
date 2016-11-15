#!/usr/bin/env bash

[[ ! -d "${HOME}/bin" ]] && mkdir "${HOME}/bin" 

cp "download-playlists" "upload-playlists" "${HOME}/bin/."
echo "$PATH" | grep "${HOME}/bin" || PATH="$PATH:${HOME}/bin"
