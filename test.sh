#!/bin/bash

active_apps=("[deploy1]aaa" "[deploy2]bbb")
deployN="deploy2"
PR_TITLE="[deploy2]bbb"


for n in "${active_apps[@]}"
do
if [ "${n}" != "${PR_TITLE}" ] && [[ ${n} == *${deployN}* ]]
then
    echo “${deployN} already exists”
    exit 1    
fi
done
