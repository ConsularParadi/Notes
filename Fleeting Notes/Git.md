---
tags:
  - cs/devops
  - version-control
---
>[!info]
>Version tracking on local system

- Tracking history
- Ease of collaboration
- Diffing capabilities

### Docs

##### Terminologies

- <u>Commit</u>: sync local changes with version control
	- To only be used when a feature is ready and a meaningful contribution is being made to the existing code.

- <u>HEAD</u>: pointer to the last commit of a branch.

- <u>Branching</u>: Work parallelly starting from the ==common ancestor== on a different feature with other collaborators.

- <u>Merging</u>: merge feature branch back with common ancestor.
	- 3-way merge: when two branches change the same line of code. It leads to merge conflicts.
	- Fast forward: make the dev branch HEAD also the HEAD of common ancestor.

- <u>.gitkeep</u>: track directory using git even if empty

>[!warning] 
>Do not change common ancestor files in another branch -> causes **merge conflict**.
>- It is the responsibility of the repo-owner to add the feature into the main code. 

##### CLI Commands
- `git clone`: clone an existing repo in new folder
- `git init`: (re)initialize a repo in the existing folder 
- `git restore $file`: undo changes after last commit
	- `--staged`: unstage file
- `git log`: shows git logs
	- `--oneline` : shorter logs
	- `--graph`: shows git graph
- `git add`: add files from workspace to staging area (starts tracking)
- `git commit`: commit files from staging area to git version control
- `git branch`: create new branch
- `git switch $branch`: switches to other branch
	- `-c`: creates branch and then switches
- `git remote`
	- `-v`: check remote repo name
	- `add $alias $repo_address`: attaches github remote repo to local machine
- `git checkout`: explore files in a previous commit of the project.

### Github