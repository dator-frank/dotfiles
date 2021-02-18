# Converts all .pcf fonts in the given directory into .otb files.
# This makes them usable by applications that cannot render bitmap fonts, since pango-1.44 dropped support.
# Requires fonttosfnt!
# - F. H.

display_usage() {
	echo -e "Usage: $0 directory"
}

if [ $# -le 0 ]
then
  display_usage
  exit 0 
fi

if [[ ($# == "--help") || $# == "-h" ]]
then 
  display_usage
  exit 0
fi

if [ command -v fonttosfnt ]
then
  echo "Missing dependency: This script requires fonttosfnt!"
  exit 1
fi

for f in $(ls $1/*.pcf); 
do 
  FILE="./$f"
  FILENAME=$(basename $FILE .pcf);
  
  fonttosfnt -v -o $FILENAME.otb $FILE
done;
