#!/bin/bash
#

read -p 'Enter the file path:' XML_URL
read -p 'Enter the path to save:' XML_SAVE


cd $XML_SAVE
mkdir Copied

i=0

while [[ "$i" -lt 10 ]] 
do
	((i++))
	m="$(($i+$i))"
	sed "s/Title/Title$i/g ; s/Artist/Artist$m/g" $XML_URL > Text$i
	mv Text* "$XML_SAVE/Copied"
done

echo $XML_URL
echo $XML_SAVE
