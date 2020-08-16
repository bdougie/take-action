<h3 align="center">Take Action</h3>
<p align="center">This is an action to assign yourself to an issue for a repo you are not a contributor to.<p>

## Usage

This GitHub Action pins an issue based on a specified label. 


## Setup

```yml
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
```
