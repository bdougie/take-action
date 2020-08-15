#!/bin/sh

echo "---"
echo "Event:"
# jq . $GITHUB_EVENT_PATH

BODY="$(jq '.comment.body' $GITHUB_EVENT_PATH)"
ISSUE_NUMBER="$(jq '.issue.number' $GITHUB_EVENT_PATH)"
LOGIN="$(jq '.comment.user.login' $GITHUB_EVENT_PATH)"
REPO="$(jq '.repository.full_name' $GITHUB_EVENT_PATH)"

# jq . $GITHUB_EVENT_PATH
echo $BODY
echo $LOGIN
echo $ISSUE_NUMBER
echo $REPO
