if [ -n "$DISPLAY" ]; then
  xset b off
fi


export PATH=$PATH:/usr/local/go/bin
export GOROOT=$HOME/installers/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$GOROOT/workspace

export PATH=$PATH:$HOME/installers/hugo/usr/bin
export PATH=$PATH:$HOME/installers/Atom/usr/bin
export PATH=$PATH:$HOME/installers/micropython/unix

parse_git_branch() {
       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
            }
	         export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

function pydir {
  mkdir $1
  touch $1/__init__.py
}

export GTEST_DIR=$HOME/installers/googletest-release-1.8.0/googletest

export PATH=$PATH:$HOME/installers/leiningen

