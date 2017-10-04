import string_utils.sh

ARISTA_STATE=$HOME/.state/arista
mkdir -p $ARISTA_STATE


ARISTA_USERNAME="brandon.ibbotson"


import .arista/containers.sh
import .arista/userservers.sh
import .arista/compilation.sh
import .arista/duts.sh
