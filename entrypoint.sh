#!/bin/sh

if [[ "${{ github.event.comment.body }}" == ".take" ]]; then
    echo "Assigning issue ${{ github.event.issue.number }} to ${{ github.event.comment.user.login }}"
    curl -H "Authorization: token ${{ secrets.GITHUB_TOKEN }}" -d '{"assignees": ["${{ github.event.comment.user.login }}"]}' https://api.github.com/repos/${{ github.repository }}/issues/${{ github.event.issue.number }}/assignees
fi
