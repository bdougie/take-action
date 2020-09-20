#!/bin/sh

BODY="$(jq '.comment.body' $GITHUB_EVENT_PATH)"
ISSUE_NUMBER="$(jq '.issue.number' $GITHUB_EVENT_PATH)"
LOGIN="$(jq '.comment.user.login' $GITHUB_EVENT_PATH | tr -d \")"
REPO="$(jq '.repository.full_name' $GITHUB_EVENT_PATH | tr -d \")"

if [[ $BODY == *".take"* ]]; then
  echo "Assigning issue $ISSUE_NUMBER to $LOGIN"
  echo "Using the link: https://api.github.com/repos/$REPO/issues/$ISSUE_NUMBER/assignees"
  curl -H "Authorization: token $GITHUB_TOKEN" -d '{"assignees":["'"$LOGIN"'"]}' https://api.github.com/repos/$REPO/issues/$ISSUE_NUMBER/assignees
fi
