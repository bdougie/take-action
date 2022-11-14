<h3 align="center">Take Action</h3>
<p align="center">This is an action to assign yourself to an issue for a repo you are not a contributor to.<p>

## Usage

This GitHub Action lets a prospective contributor assign themselves to an issue, and optionally leaves a comment on the issue.

- `message`<br />The message to display to the user once they have assigned themselves to an issue.
- `trigger`<br />The string that take action will search for in the comment body to activate the action.

## Setup

This GitHub Action can be optionally configured with a message to the prospective contributor.

The Action uses the built-in `${{ secrets.GITHUB_TOKEN }}` for authentication, so you'll need to ensure you've appropriately set [the permissions for the GitHub Token](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#permissions-for-the-github_token) so that your workflow can update Issues.

To do this, follow the instructions in this doc: [Managing GitHub Actions Permissions for your repository](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository#managing-github-actions-permissions-for-your-repository).

### Example Workflow:

```yaml
# .github/workflows/take.yml 
name: Assign issue to contributor
on: 
  issue_comment:

jobs:
  assign:
    name: Take an issue
    runs-on: ubuntu-latest
    permissions:
      issues: write
    steps:
    - name: take the issue
      uses: bdougie/take-action@main
      with:
        message: Thanks for taking this issue! Let us know if you have any questions!
        trigger: .take
```