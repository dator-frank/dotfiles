#!/bin/bash

echo -n "This script will install the dotfiles stored in ./configs/. Proceed? [Y/n]"
read RUN

install() {
  source paths.conf

  echo "Backing up current dotfiles..."
  if [ ! -d "./backup" ]
  then 
    mkdir ./backup
  else 
    rm -rf ./backup
  fi
	
  for i in "${PATHS[@]}"
  do 
	  echo "+ $i"
  	cp $i ./backup/ -r
  done

  echo "Your old dotfiles have been backed up in ./backup/"
  echo "Installing new dotfiles from ./configs/ ..."

  cp ./configs/* ~ -r

  echo -n "Done! You may have to re-login or something.\nRemember to change your default terminal in .config/i3/config and set your fonts wherever necessary."
}

case $RUN in 
  n) 
    exit 0 ;;

  *) 
    install ;;
esac
