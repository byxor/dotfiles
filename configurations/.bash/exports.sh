if [ $OS = $OSX ]; then
  echo "On Mac; skipping most environment variables."
  
  export EDITOR=nvim

  # Atlassian scripts for jira server
  export ATLASSIAN_SCRIPTS=$HOME/projects/atlassian-scripts
  source $ATLASSIAN_SCRIPTS/sourceme.sh
  
  # Postgres
  export PATH="/usr/local/opt/postgresql@11/bin:$PATH"

else
  # Editors
  # export EDITOR=emacs
  export EDITOR=nvim

  # PATH
  export PATH=$PATH:$HOME/software/bin
  export PATH=$PATH:/snap/bin

  # Golang
  export GOPATH=$HOME/projects/go
  export PATH=$PATH:$GOPATH/bin
  export PATH=$PATH:/usr/local/go/bin

  # Android
  export ANDROID_HOME=$HOME/Android/Sdk
  export PATH=$PATH:$ANDROID_HOME/emulator
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/tools/bin
  export PATH=$PATH:$ANDROID_HOME/platform-tools

  # Java
  export JDK_18="/usr/lib/jvm/java-8-oracle"
  export JAVA_HOME=$JDK_18
  export PATH=$PATH:$JDK_18/bin
  export JDK_16=$JDK_18
  export JDK_17=$JDK_1

fi
