#!/bin/bash

active_apps=("[deploy1]aaa" "[deploy2]bbb")
PR_TITLE="[deploy3]aaaa"
deployN=$(echo "${PR_TITLE}" | grep -o "deploy[0-9]" | cat)

# for n in "${active_apps[@]}"
# do
# if [ "${n}" != "${PR_TITLE}" ]; then
#               echo "${n}"
#               echo "${PR_TITLE}"
#               echo 'ok1'
#             fi
#             if [[ ${n} == *${deployN}* ]]; then
#               echo 'ok2'
#             fi
# if [ "${n}" != "${PR_TITLE}" ] && [[ ${n} == *${deployN}* ]]
# then
#     echo "${n}"
#     echo "${PR_TITLE}"
    
#     echo "${deployN}"
#     echo “${deployN} already exists”
#     exit 1    
# fi
# done

for ((i = 0; i < ${#active_apps[@]}; i++)) {
    echo "${active_apps[i]}"
    if [ "${active_apps[i]}" != "${PR_TITLE}" ] && [[ "${active_apps[i]}" == *${deployN}* ]]
then
    echo “${deployN} already exists”
    exit 1    
fi
}
