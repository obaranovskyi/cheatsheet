# Git cheat sheet

### Terminology
  * **Untracked** - Changes are not in Git.
  * **Unstaged** - Changes are in Git but not marked for commit.
  * **Staged** - Changes are in Git and marked for commit.
  * **index** The "index" holds a snapshot of the content of the working tree, and it is this snapshot that is taken as the contents of the next commit.
    Thus after making any changes to the working directory, and before running the commit command, you must use the `add` command to add any new or modified files to the index.
    (The Git index is used as a staging area between your working directory and your repository.)
  * **HEAD** - the current commit your repo is on. Most of the time HEAD points to the latest commit in your current branch, but that doesn't have to be the case.
    HEAD really just means "what is my repo currently pointing at".
  * **master** - the name of the default branch that git creates for you when first creating a repo. 
  * **origin** - The default name that git gives to your main remote repo. 
  * **Staging** - Telling Git what files to include in the next commit.
  * **Committing** - Recording the staged snapshot with a descriptive message.

#### Initialize/Clone
  * `git init` - initialize the repository, it will create `.git` directory. Configuration will be created at `<repository-root>/.git/config`.
  * `git clone` - downloads a project with the entire history from the remote repository.

#### Status
  * `git status` - show repository status

#### Logs
  * `git log` - show git logs
  * `git log --oneline` - show git logs with one line formatting 
  * `git log <file>` - show git logs where current file present
  * `git log --oneline <file>` - show git logs where current file present with one line format

#### Difference
  * `git diff`

#### Add to Stage
  * `git add <file>` - add file to stage
  * `git add .` - add all to stage

#### Commit
  * `git commit -a -m "<commit-message>"` - commit the changes with the message

#### View commits
  * `git checkout 2e8dd5ya` - View commit with ID `2e8dd5ya`, to get ID enter `git log --online`
  * `git checkout master` - Return to the `master` last commit

#### Tag a Release
  * `git tag -a v1.0 -m "Stable version of the website"` - tagging the most recent commit
  * `git checkout v1.0` - to view by tag (that we added before, important to have before `-m` flag)

#### Removing/Restoring files from working tree
  * `git rm <file>` - remove file from working directory, and stop tracking it
  * `git rm -r .` - remove all files from working tree
  * `git rm -f <file>` - remove file from working tree. File will be removed from folder, even if it just was updated.
  * `git rm --cached <file>` - A tracked file becomes untracked. This will remove the file from Git while preserving your local copy.
  * `git restore --staged <file>` - To restore staged file.
  * `git restore .` - Discard unstaged changed in git

<ins>**`git rm` vs `rm`:**</ins> `git rm` will remove the file from the index and working directory (only index if you used `--cached`) so that the deletion is staged for the next commit.

#### Configuring git
  * `git config --list --local` - check local configurations
  * `git config --list --global` - check global configurations
  * `git config --global user.name "John Doe"` - set global user name
  * `git config --global user.email "john.doe@gmail.com"` - set global email

###### Configuration file levels 
  * **Local** - Applies only to the current repository the configuration file is stored at `<repository-root>/.git/config`
  * **Global** - Applies to all repositories under the user's home directory; the configuration file is stored at `$HOME/.config/git/config` and/or at `$HOME/.gitconfig`, with the latter being only available in newer versions of Git.`$HOME/.gitconfig` will override `$HOME/.config/git/config`
  * **System** - Applies to all repositories on your machine; The configuration file stored at `$HOME/etc/gitconfig`. The local configuration settings will override the global settings, which, in turn, override the system settings.

#### Stash
  * `git stash` - stash all changes
  * `git stash save "some text goes here"` - named stash
  * `git stash list` - show stash list
  * `git stash apply` - apply top stash
  * `git stash apply stash@{3}` - apply specific stash, where `3` is the index of the stash (index starting from `0`)
  * `git stash pop` - apply changes/stash and remove stash
  * `git stash drop` - drop top stash
  * `git stash drop <name>` - drop stash using name
  * `git stash clear` - to clear all history

#### Reset
  * `git reset` - Reset everything - retain changes
  * `git reset HEAD <file>` - Reset the file to current commit (HEAD)
  * `git reset --hard` - Discard everything permanently
  * `git clean -f` - Remove untracked files

Example: 
1. we updated existing file _index.html_
2. we added new file _dummy.html_

To undo changes in _index.html_ run `git reset --hard`, this changes all tracked files to match the most recent commit. \
To remove untracked files run `git clean -f`, which in our case is _dummy.html_.
 
#### Undo committed changes
  * `git revert 514fbe7` - Undo the specified commit by applying a new commit.

**Note** When using `git revert` remember to specify the commit that you want to undo - **NOT** the stable commit that you want to return to.

#### Branches
  * `git branch` - View existing branches
  * `git branch crazy` - Create new branch
  * `git checkout crazy` - Switch to branch to `crazy`
  * `git checkout -b iss53` - Create branch `iss53` and switch to it
  * `git branch -d localBranchName` - delete branch locally
  * `git branch -D localBranchName` - delete branch locally, even if there are changes
  * `git push origin --delete remoteBranchName` - delete branch remotely

#### Merge
  * `git merge css` - merge `css` branch into the current

#### Reset(undo) all commits until 
1. `git reset --hard <commit_id>`
2. `git push --force`
