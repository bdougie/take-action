<h3 align="center">Take Action</h3>
<p align="center">This is an action to assign yourself to an issue for a repo you are not a contributor to.<p>

## Usage

This GitHub Action lets a prospective contributor assign themselves to an issue, and optionally leaves a comment on the issue.

- `message`<br />The message to display to the user once they have assigned themselves to an issue.
- `trigger`<br />The string that take action will search for in the comment body to activate the action.

## Setup

This GitHub Action requires a GITHUB_TOKEN and can be optionally configured with a message to the prospective contributor.
  
Before you use this GitHub Action, you'll need to create a personal access token if you are using it on a personal repository. If you are wanting to use this for a organisation repository, you'll need an personal access token for your organisation. Check out the GitHub Docs on [how to create a personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-fine-grained-personal-access-token) and [how to setup a personal access token for organisations](https://docs.github.com/en/enterprise-cloud@latest/organizations/managing-programmatic-access-to-your-organization/setting-a-personal-access-token-policy-for-your-organization).
  
You'll need this token to replace `github.token` on line 33 below.
  
```yaml
# .github/workflows/take.yml 
name: Assign issue to contributor
on: 
  issue_comment:

jobs:
  assign:
    name: Take an issue
    runs-on: ubuntu-latest
    steps:
    - name: take the issue
      uses: bdougie/take-action@main
      env:
        GITHUB_TOKEN: ${{ github.token }}
      with:
        message: Thanks for taking this issue! Let us know if you have any questions!
        trigger: .take
```
