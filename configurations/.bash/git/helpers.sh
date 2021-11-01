alias git-log="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

git config --global alias.add-commit '!git add -A && git commit'

function gcb() {
    git clone "git@github.com:byxor/$1"
}

function gi() {
    curl -sL https://www.gitignore.io/api/$@
}

function git-diff-0() {
    git-diff-1 "origin/$(get_current_git_branch)"
}

function git-diff-1() {
    git-diff-2 HEAD $1
}

function git-diff-2() {
    git diff-tree --color=always -p -r $2 $1 | less -r
}

function unfuck-git() {
    trash-put .git/index.lock
}

function lazygit() {
  git add .
  if git commit -a -m "$1"; then
    read -r -p "Are you sure you want to push these changes? [y/N]: " response
    case "$response" in
      [yY][eE][sS]|[yY])
        git push
        ;;
      *)
        git reset HEAD~1 --soft
        echo "Reverted changes."
        ;;
    esac
  fi
}

function git-copy-file-from-another-branch() {
    local branch="$1"
    local file="$2"
    
    mkdir -p $(dirname $file)
    git show $branch:$file > $file
}
