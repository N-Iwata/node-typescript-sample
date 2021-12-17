#!/bin/bash

active_apps='
[deploy3]aaa
[deploy2]bbb
'
array_text=(`echo $active_apps`)
# echo "${active_apps}"
echo "${array_text[0]}"
echo "${array_text[1]}"
PR_TITLE="[deploy1]aaa"
deployN=$(echo "${PR_TITLE}" | grep -o "deploy[0-9]" | cat)

for i in "${!active_apps[@]}"
do
    if [ "${active_apps[${i}]}" != "${PR_TITLE}" ] && [[ "${active_apps[${i}]}" == *${deployN}* ]]
    then
        echo “${deployN} already exists”
        exit 1    
    fi
done


# for ((i = 0; i < ${!active_apps[@]}; i++)) {
#     echo "${active_apps[${i}]}"
#     if [ "${active_apps[${i}]}" != "${PR_TITLE}" ] && [[ "${active_apps[${i}]}" == *${deployN}* ]]
# then
#     echo “${deployN} already exists”
#     exit 1    
# fi
# }
