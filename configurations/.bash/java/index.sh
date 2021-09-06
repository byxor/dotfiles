function j8() {
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
}

# jenv setup
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
