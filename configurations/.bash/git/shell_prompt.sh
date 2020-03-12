function get_current_git_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

COL_END='\[\e[m\]'
COL_GRAY='\[\e[2m\]'
COL_UNDERLINE='\[\e[4m\]'

export PS1="$COL_GRAY$COL_UNDERLINE\u@\h$COL_END \w $COL_GRAY\$(get_current_git_branch) ▶$COL_END "

