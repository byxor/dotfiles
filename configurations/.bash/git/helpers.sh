alias git-log="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

git config --global alias.add-commit '!git add -A && git commit'

function gcb() {
    git clone "git@github.com:byxor/$1"
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
