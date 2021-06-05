#!/bin/bash

batch_commit() {
    echo -e "\u001b[34;1mBatch Comitting: $(pwd | awk -F "/" '{print $NF}') \u001b[0m"
    for file in $(ls "$flags"); do
        git add "$file"
        echo -e "\u001b[32;1mAdded $file \u001b[0m"
        git commit -m "Add $file"
    done
}

select_files() {
    more="Y"
    while [[ "$more" == "Y" || "$more" == "y" ]]; do
        PS3=$(echo -en "\u001b[34;1m=> Enter file number: \u001b[0m")
        echo -en "\u001b[29;1m"
        select file in $(ls "$flags"); do
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
}

if [[ $1 == "-a" ]]; then
    echo -e "\u001b[34;1mAuto Comitting: $(pwd | awk -F "/" '{print $NF}') \u001b[0m"
    for file in $(ls -Atr); do
        git add "$file"
        echo -e "\u001b[32;1mAdded $file \u001b[0m"
        git commit -m "Add $file"
    done
elif [[ $1 == "-n" ]]; then
    t=""
    select_files
elif [[ $1 == "-h" ]]; then
    echo -e "\t  \tSelect files sorted by time\n\t-a\tAuto commit files\n\t-n\tSelect files sorted by name\n\t-h\tShow help"
else
    t="t"
    select_files
fi
