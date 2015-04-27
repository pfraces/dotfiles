Git
===

User
----

**~/.gitconfig**

    [user]
      email = pfraces@gmail.com
      name = Pau Fracés

Editor
------

**~/.gitconfig**

    [core]
      editor = gvim -f

Global ignores
--------------

**~/.gitconfig**

    [core]
      excludesfile = ~/.gitignore

**~/.gitignore**

    # vim temporary files
    .*.swp
    
    # gedit temporary files
    *~
    
    # logs
    *.log

Cache password
--------------

**~/.gitconfig**

    [credential]
      helper = cache --timeout=3600

Meld
----

    pacman -S meld pygtksourceview2

**~/.gitconfig**

    [merge]
      tool = meld

Lanch it with `git mergetool`

### Config

**Edit > Preferences**

*   Enable syntax highlight
*   Enable line numbers
*   Enable highlight current line

Ultimate Git Script
-------------------

    save [tag]

**~/.bashrc**

```bash

##
# ultimate git script
# ===================
#
# Usage
# -----
#
#     save [tag]
##

function save () {
    function err () {
        code="ERR_$1"
        msg="MSG_$code"

        echo err: ${!msg} >&2
        return ${!code}
    }

    ERR_NO_GIT_REPO=1
    ERR_NO_USER_NAME=2
    ERR_NO_USER_EMAIL=3
    ERR_EMPTY_REPO=4
    ERR_NO_ORIGIN=5
    ERR_MASTER_BRANCH=6
    ERR_NO_COMMIT_MESSAGE=7
    ERR_MERGE_CONFLICT=8

    MSG_ERR_NO_GIT_REPO='not a git repository'
    MSG_ERR_NO_USER_NAME='unable to commit without user name'
    MSG_ERR_NO_USER_EMAIL='unable to commit without user email'
    MSG_ERR_EMPTY_REPO='unable to commit to an empty repo'
    MSG_ERR_NO_ORIGIN='unable to commit to a repo without origin'
    MSG_ERR_MASTER_BRANCH='unable to commit to master branch'
    MSG_ERR_NO_COMMIT_MESSAGE='unable to commit with empty message'
    MSG_ERR_MERGE_CONFLICT='merge conflict'

    currentBranch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    newTag=$1

    if test -z "$currentBranch"
    then return $(err NO_GIT_REPO)
    fi

    if test -z "$(git config user.name)"
    then return $(err NO_USER_NAME)
    fi

    if test -z "$(git config user.email)"
    then return $(err NO_USER_EMAIL)
    fi

    if test "$currentBranch" = 'HEAD'
    then return $(err EMPTY_REPO)
    fi

    if test -z "$(git remote | grep origin)"
    then return $(err NO_ORIGIN)
    fi

    if test "$currentBranch" = 'master' -a "$allow_master" != 'true'
    then return $(err MASTER_BRANCH)
    fi

    if test -n "$(git status --short)"
    then
        git add --all
        git commit
        
        if test "$?" != "0"
        then
            git reset
            return $(err NO_COMMIT_MESSAGE)
        fi
    fi

    git pull origin master || return $(err MERGE_CONFLICT)
    
    test -n "$newTag" && git tag $newTag
    git push origin $currentBranch
    git push origin --tags
}
```

Aliases
-------

**~/.bashrc**

```bash
alias g='save'
alias g!='allow_master=true save'

alias gqb='git rev-parse --abbrev-ref HEAD 2>/dev/null'
alias gqr='git rev-parse --show-toplevel'

alias ga='git add --all'
alias gaz='git reset'
alias gb='git checkout -b'
alias gbm='git checkout master && git pull origin master'
alias gc='git add --all && git commit'
alias gd='git diff'
alias gdg='(meld $(gqr)/src &)'
alias gdz='git reset --hard'
alias gi='git update-index --assume-unchanged'
alias gil='git ls-files -v | grep "^[[:lower:]]"'
alias giz='git update-index --no-assume-unchanged'
alias gk='find . -type d -empty -exec touch {}/.keep \;'
alias gl='git log --oneline --decorate --graph'
alias gm='git mergetool'
alias gp='git push origin $(gqb)'
alias gr='git remote -v'
alias gs='git status'
alias gu='git pull origin master'
```

Github helpers
--------------

### Clone a github repo

**~/.bashrc**

```bash
function ghc () {
    account=$1
    repo=$2

    git clone https://github.com/${account}/${repo}.git
}
```

### Clone a github own repo

**~/.bashrc**

```bash
function ghco () {
    repo=$1
    account=$2
    
    if test -z $account
    then account=pfraces
    fi

    git clone https://pfraces@github.com/${account}/${repo}.git
}
```

### Github export

**~/.bashrc**

```bash
function ghe () {
    account=$1
    repo=$2

    git clone --depth=1 https://github.com/${account}/${repo}.git
    rm -rf ${repo}/.git
}
```

Online books
------------

*   http://git-scm.com/book
*   http://alx.github.io/gitbook/
