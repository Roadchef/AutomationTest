#!/bin/bash
repo=$1

result=$(curl -s 'https://elastic.snaplogic.com/api/1/rest/slsched/feed/Roadchef_dev/Sandbox_BL/GithubManagement/RunUnitTests%20Task?repo='"${repo}" -H "Authorization: Bearer cJe49UYfIF3W8NwozXEcBo4yTBZL6YYZ")
success=`echo ${result} | jq -r '.[].success'`
text=`echo ${result} | jq -r '.[].text'`


if [[ $success == "true" ]]; then
    echo "success: ${success}"
    echo "Tests completed successfully"
    echo "$text"
    exit 0
else
    echo "Tests failed"
    echo "$text"
    exit -1
fi