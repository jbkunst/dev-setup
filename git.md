# Never Forget Github

## Configure User
```
git config --global user.email "jbkunst@gmail.com"
git config --global user.name "Joshua"
```

## Generate Key
```
ssh-keygen
cat ~/.ssh/id_rsa.pub
```


## Delete back to specific commit on remote repository with Git
```
git reset --hard fj5789sufj
```
source: http://lrotherfield.com/blog/delete-remote-git-repo-to-specific-commit/

## Update your fork
```
git pull https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git BRANCH_NAME
```
source: https://help.github.com/articles/merging-an-upstream-repository-into-your-fork/


## Caching your GitHub password in Git (windows)
```
git config --global credential.helper wincred
```
source: https://help.github.com/articles/caching-your-github-password-in-git/

## Provide username and password when clone a repo

```
git clone https://username:password@github.com/username/repository.git
```

Source: https://stackoverflow.com/questions/10054318/how-do-i-provide-a-username-and-password-when-running-git-clone-gitremote-git
