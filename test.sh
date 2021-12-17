#!/bin/bash

active_apps=("[deploy1]aaa" "[deploy2]bbb")
PR_TITLE="[deploy3]bbb"
deployN=$(echo "${PR_TITLE}" | grep -o "deploy[0-9]" | cat)

for n in "${active_apps[@]}"
do
if [ "${n}" != "${PR_TITLE}" ] && [[ ${n} == *${deployN}* ]]
then
    echo "${n}"
    echo "${PR_TITLE}"
    
    echo "${deployN}"
    echo “${deployN} already exists”
    exit 1    
fi
done
