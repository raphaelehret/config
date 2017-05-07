# Config

This repository stores my dotfiles and my everyday scripts.

## Folders

### Shell

This directory contains two of my dotfiles : 
- `.zshrc`
- `.profile`

`.zshrc` has dependencies over oh-my-zsh

The first is aimed at the configuration of zsh, while the 
other contains everything else (aliases, etc). This is subject
to change as I would like to make a dot file for each.

---

An installation script named `install.sh` is also present, to install oh-my-zsh,
and to create symbolic hyperlinks of the dotfiles to your home directory

### Vim

My vim configuration, greatly inspired by 
[Charles Gueunet's vim configuration](https://github.com/CharlesGueunet/vimmic).

This configuration is pretty light, it only embeeds Syntastic linters, as well
as a few *Qol* changes. The `.vimrc` is commented and should be easy to understand.

### Scripts

This directory contains the scripts I use daily. Dependencies of those scripts
should be written on the help prompt of each file.

The scripts are the following:
- i3-wd-name : allow naming a given desktop on i3
- inscreen : launch a given command on a detached screen instance
- lockscreen : locks the screen with a random wallpaper
- mypuush : screenshots the desktop and uploads the picture
- rsearch : opens different image reverse searching browsers
- toggle\_layout : changes keyboard layout between US and FR
- torrent-reader : gives numerous informations on a .torrent file
- wpp-changer : sets a randow wallpaper every N seconds
- wpp-format : recursively translate wallpapers from jpeg to png

### i3

My [i3](https://i3wm.org/) config.

- `config` is the main configuration file for i3
- `.i3status` is the configuration file of the i3bar software
- `scripts` is the directory containing the current scripts used by i3

--- 

An installation script `install.sh` helps setting up the configuration

### playlists

These two scripts are custom scripts used to download playlists from youtube
and upload them to a google music account

### theme

My zsh custom themes.

## License

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.
