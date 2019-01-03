globalNpmPath=~/.npm-global

mkdir -p $globalNpmPath

npm config set prefix $globalNpmPath

export PATH=$PATH:$globalNpmPath/bin
