#!/bin/bash

active_apps=("[deploy1]aaa" "[deploy2]bbb")
deployN="deploy3"
PR_TITLE="[deploy3]bbb"


for n in "${active_apps[@]}"
do
if [ "${n}" != "${PR_TITLE}" ] && [[ ${n} == *${deployN}* ]]
then
    echo “${deployN} already exists”
    exit 1    
fi
done
