#!/bin/bash
#
# This script changes and increment strings
# You will be promted to enter XML_URL and save location

# Make sure the script is being executed with superuser privileges.
if [[ "${UID}" -ne 0 ]]
then
	echo 'Please run with sudo or root.'
	exit 1
fi

# Get the XML file
read -p 'Enter the file path:' XML_URL

# Get the XML save location
read -p 'Enter the path to save:' XML_SAVE

# Create new directory for new files

cd $XML_SAVE
mkdir Copied

# Set variable
i=0

# Create while loop
while [[ "$i" -lt 10 ]] 
do
	((i++))
	m="$(($i+$i))"
	sed "s/Title/Title$i/g ; s/Artist/Artist$m/g" $XML_URL > Text$i
	mv Text* "$XML_SAVE/Copied"
done

# If command not successfully executed change exit status 1 
if [[ "${?}" -ne 0 ]]
then
	echo 'The file not changed.'
	exit 1
fi

# Display the XML_URL and XML_SAVE location where the file was saved.  
echo 'XML_URL'
echo "${XML_URL}"
echo 'XML_SAVE'
echo "${XML_SAVE}"
exit 0
