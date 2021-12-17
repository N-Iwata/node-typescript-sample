#!/bin/bash

active_apps='
[deploy3]aaa
[deploy2]bbb
'
array_text=(`echo $active_apps`)

PR_TITLE="[deploy2]aaa"
deployN=$(echo "${PR_TITLE}" | grep -o "deploy[0-9]" | cat)

# for i in "${!active_apps[@]}"
# do
#     echo ${array_text[i]}
#     echo ${PR_TITLE}
#     if [ ${array_text[i]} != ${PR_TITLE} ] && [[ ${array_text[i]} == *${deployN}* ]]
#     then
#         echo “${deployN} already exists”
#         exit 1    
#     fi
# done


for ((i = 0; i < ${#array_text[@]}; i++)) {
    echo "${array_text[i]}"
    if [ "${array_text[i]}" != "${PR_TITLE}" ] && [[ "${array_text[i]}" == *${deployN}* ]]
then
    echo “${deployN} already exists”
    exit 1    
fi
}
