#!/bin/bash

echo -n "This script will collect the files specified in paths.conf. Run? [Y/n]"
read RUN

collect() {
	echo "Reading paths..."
#	typeset -A PATHS
#
#	while read LINE
#	do 
#		if [ echo $LINE | grep -F = &>/dev/null ]
#		then 
#			PATH=$(echo "$LINE" | cut -d '=' -f 1)
#			PATHS[$PATH]=$(echo "$LINE" | cut -d '=' -f 2-)
#   fi
#	done < paths.conf
  source paths.conf

	if [ ! -d "./configs" ]
	then
		mkdir ./configs
	fi

	echo "Collecting configs..."
	for i in "${PATHS[@]}"
	do 
		echo "+ $i"
		# this kind of sucks?
		if [[ $i =~ "/.config/" ]]
		then 
			if [ ! -d "./configs/.config" ]; then mkdir -p ./configs/.config; fi
			cp $i ./configs/.config/ -r
		else 
  		cp $i ./configs/ -r
		fi
	done

	echo "All done! Your current dotfiles have been saved in configs/"
}

case $RUN in
	n)
		exit 0 ;;

	*)
		collect ;;
esac
