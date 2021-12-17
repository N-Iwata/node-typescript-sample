#!/bin/bash

active_apps='[deploy3]Add aaa
[deploy2]Add bbb'
IFS='
'
array_text=($active_apps)

PR_TITLE="[deploy1]Add bbb"
deployN=$(echo "${PR_TITLE}" | grep -o "deploy[0-9]" | cat)

for ((i = 0; i < ${#array_text[@]}; i++)) {
    # echo "${array_text[i]}"
    # echo "-----------"
    # echo ${PR_TITLE}
    if [ "${array_text[i]}" != "${PR_TITLE}" ] && [[ "${array_text[i]}" == *${deployN}* ]]
then
    echo “${deployN} already exists”
    exit 1    
fi
}
