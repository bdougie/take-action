#!/bin/sh

echo "---"
echo "Event:"
jq . $GITHUB_EVENT_PATH

BODY="$(jq '.comment.body' $GITHUB_EVENT_PATH)"
ISSUE_NUMBER="$(jq '.issue.number' $GITHUB_EVENT_PATH)"
LOGIN="$(jq '.comment.user.login' $GITHUB_EVENT_PATH)"
REPO="$(jq '.repository' $GITHUB_EVENT_PATH)"

# jq . $GITHUB_EVENT_PATH
echo $BODY
echo $ISSUE_NUMBER
echo $REPO

if [[ "$BODY" == ".take" ]]; then
    echo "Assigning issue $ISSUE_NUMBER to $LOGIN"
    curl -H "Authorization: token ${{ secrets.GITHUB_TOKEN }}" -d "{'assignees':
    ["$LOGIN"]}" https://api.github.com/repos/$REPO/issues/$ISSUE_NUMBER/assignees
fi
