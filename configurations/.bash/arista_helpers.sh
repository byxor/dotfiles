ARISTA_STATE=$HOME/.state/arista
mkdir -p $ARISTA_STATE

ARISTA_USERNAME="brandon.ibbotson"

MODULES=(.arista/containers .arista/userservers .arista/compilation .arista/duts .arista/misc)
import-multiple ${MODULES[@]}
