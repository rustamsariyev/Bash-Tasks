#!/bin/bash
#

read -p 'Enter the file path:' XML_URL
read -p 'Enter the path to save:' XML_SAVE


cd $XML_SAVE
mkdir Copied

for n in {1..10..1} 
do
	sed "s/Title/Title$n/g" $XML_URL > Text$n
	mv Text* "$XML_SAVE/Copied"
done

echo $XML_URL
echo $XML_SAVE
