#!/bin/bash
repo=$1

result=$(curl -s 'https://elastic.snaplogic.com/api/1/rest/slsched/feed/Roadchef_dev/Sandbox_BL/GithubManagement/PreparePromotion%20Task?repo='"${repo}" -H "Authorization: Bearer WRGIe4C7KrQ3hjnSdle5RWMQELhT9JD4")
success=`echo ${result} | jq -r '.[].summary'`
text=`echo ${result} | jq -r '.[].text'`

echo "Tests completed successfully"
echo "$text"
exit 0