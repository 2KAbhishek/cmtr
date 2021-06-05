#!/bin/bash

if  [[ $1 == "-a" ]];
then
    for file in $(ls -atr); do
    git add "$file"
    echo -e "\u001b[32;1m Added $file \u001b[0m"
    git commit -m "Add $file"
    done
else
PS3="Enter file number: "
select file in $(ls -at); do

    echo -en "\u001b[34;1m Add $file? (y/n) \u001b[0m"
    read -r input
    if [[ "$input" == "Y" || "$input" == "y" ]];
    then
        git add "$file"
        echo -e "\u001b[32;1m Added $file \u001b[0m"
    else
        continue
    fi

    echo -en "\u001b[34;1m Enter commit message: \u001b[0m"
    read -r msg
    if [ -z "$msg" ]
    then
        git commit -m "Add $file"
    else
        git commit -m "$msg"
    fi

    done
fi
