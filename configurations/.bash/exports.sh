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
export PATH=$PATH:$HOME/installers/leiningen
export GTEST_DIR=$HOME/installers/googletest-release-1.8.0/googletest

