# Dotfiles

These are my dotfiles and a couple of scripts to save/install them. 

## Included
 - .Xresources for URxvt and such. The colour scheme is stored here, so go ahead and steal it from there.
 - Configs for i3 and polybar, as well as colour schemes for dunst and rofi.
 - .bashrc, .vimrc and the like.
 - A few scripts to automate some stuff. 
 - The fonts I'm using on my own machine.


Note that most of the included fonts are bitmap fonts (.pcf), which are no longer supported by pango since 1.44. To circumvent this I've wrapped some of them in the .otb format, so they can be used more or less anywhere.
  
## Requirements
 - dunst
 - i3 (or i3-gaps)
 - polybar
 - rofi
 - alacritty (optional)
 - picom (optional)

## Installation
Included in this repo is a shellscript called install.sh. It will collect all your current dotfiles specified in the paths.conf file. Run ./install.sh to install the dotfiles from configs/. This will also back up your current configuration to backups/.

## Collecting dotfiles
The other included script, collect.sh can be used to collect your current dotfiles. It is more or less the same as install.sh, but for generating your own configs/ that can be installed later with install.sh (perhaps on an other machine). 

## Configuration
Simply add the paths you want to include in the PATHS variable given in paths.conf. The given paths will be installed to and/or backed up when running install.sh or collect.sh

## Screenshots
![Screenshot 1](https://i.imgur.com/yOupBQH.jpg "")
![Screenshot 2](https://i.imgur.com/fFfrfcu.jpg "")
![Screenshot 3](https://i.imgur.com/lMZ6WNr.png "")

