#!/bin/bash
if [[ $1 == "-a" ]]; then
    echo -e "\u001b[34;1mAuto Comitting: $(pwd | awk -F "/" '{print $NF}') \u001b[0m"
    for file in $(ls -Atr); do
        git add "$file"
        echo -e "\u001b[32;1mAdded $file \u001b[0m"
        git commit -m "Add $file"
    done
else
    more="Y"
    while [[ "$more" == "Y" || "$more" == "y" ]]; do
        PS3=$(echo -en "\u001b[34;1m=> Enter file number: \u001b[0m")
        echo -en "\u001b[29;1m"
        select file in $(ls -At); do
            echo -en "\u001b[31;1mAdd $file? (y/n) \u001b[0m"
            read -r input
            if [[ "$input" == "Y" || "$input" == "y" ]]; then
                git add "$file"
                echo -e "\u001b[32;1mAdded $file \u001b[0m"
            else
                break
            fi

            echo -en "\u001b[32;1m=> Enter commit message: \u001b[0m"
            read -r msg
            if [ -z "$msg" ]; then
                git commit -m "Add $file"
                break
            else
                git commit -m "$msg"
                break
            fi
        done
        echo -en "\u001b[36;1mAdd more? (y/n) \u001b[0m"
        read -r more
    done
fi
