#!/bin/bash

backup_commit() {
    folder="$(pwd | awk -F "/" '{print $NF}')"
    timestamp=$(date +"%Y-%m-%d %T")
    echo -e "\u001b[34;1mComitting Backup for $folder: \u001b[0m"
    git add .
    git commit -m "$folder backup: $timestamp"
}

batch_commit() {
    echo -e "\u001b[34;1mBatch Comitting: $(pwd | awk -F "/" '{print $NF}') \u001b[0m"
    for file in *; do
        git add "$file"
        echo -e "\u001b[32;1mAdded $file\u001b[0m"
        git commit -m "feat: add $file"
    done
}

select_commit() {
    more="Y"
    while [[ "$more" == "Y" || "$more" == "y" ]]; do
        PS3=$(echo -en "\u001b[34;1m=> Enter file number: \u001b[0m")
        echo -en "\u001b[29;1m"
        select file in $(git diff --name-only); do
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
                git commit -m "feat: add $file"
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

sync_commit() {
    echo -e "\u001b[34;1mSyncing... \u001b[0m"
    git pull --rebase --autostash
    backup_commit
    git push
}

if [[ $1 == "-a" ]]; then
    batch_commit
elif [[ $1 == "-b" ]]; then
    backup_commit
elif [[ $1 == "-s" ]]; then
    sync_commit
elif [[ $1 == "-h" ]]; then
    echo -e "\t   \t\t Select changed files and commit"
    echo -e "\t-a \t\t Commit all files in seperate commits"
    echo -e "\t-b \t\t Commit all files in a backup commit"
    echo -e "\t-s \t\t Backup and Sync commit"
    echo -e "\t-h \t\tShow this help"
else
    select_commit
fi
