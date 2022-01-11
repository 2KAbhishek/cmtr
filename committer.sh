#!/bin/bash

batch_commit() {
    echo -e "\u001b[34;1mBatch Comitting: $(pwd | awk -F "/" '{print $NF}') \u001b[0m"
    for file in $(ls "$flags"); do
        git add "$file"
        echo -e "\u001b[32;1mAdded $file$suffix\u001b[0m"
        git commit -m "Add $file$suffix"
        echo "$suffix"
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

suffix="$2"

if [[ $1 == "-a" ]]; then
    flags="-Atr"
    batch_commit "$flags" "$suffix"
elif [[ $1 == "-an" || $1 == "-na" ]]; then
    flags="-A"
    batch_commit "$flags" "$suffix"
elif [[ $1 == "-n" ]]; then
    flags="-A"
    select_files
elif [[ $1 == "-h" ]]; then
    echo -e "\t  \t\tSelect files sorted newest first"
    echo -e "\t-a \t\tBatch commit files oldest first"
    echo -e "\t-n\t\tSelect files sorted by name"
    echo -e "\t-an | -na \tBatch commit files sorted by name"
    echo -e "\t-h\t\tShow help"
    echo -e "\t[suffix]\tAdd suffix to commit message"
else
    flags="-At"
    select_files
fi
