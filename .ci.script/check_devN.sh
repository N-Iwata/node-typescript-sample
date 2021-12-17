#!/bin/bash

active_apps=$(gh pr list --state=open | cut -f2 | cat)
IFS='
'
active_apps_array=($active_apps)
deployN=$(echo "${PR_TITLE}" | grep -o "deploy[0-9]" | cat)

for ((i = 0; i < ${#active_apps_array[@]}; i++)) {
if [ "${active_apps_array[i]}" != "${PR_TITLE}" ] && [[ "${active_apps_array[i]}" == *${deployN}* ]]
then
    echo “${deployN} already exists”
    exit 1    
fi
}