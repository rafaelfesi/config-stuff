get_current_branch() {
   #   NAME=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
   local REF NAME
   REF=`git symbolic-ref -q HEAD`
   NAME=${REF##refs/heads/}

   echo $NAME
}

get_product_branch() {
   git config --get remote.origin.url | sed 's/.*\/\([a-zA-Z0-9_-]*\)\.git$/\1/'
}

get_p4_cl() {
   git log -1 $1 | sed -n 's/.*\[git-p4: depot-paths.*change = \([0-9]*\).*/\1/p'
}

error() {
   echo $1 >&2
   exit 1
}

get_upstream_branch() {
   local REF UPSTREAM
   REF=`git symbolic-ref -q HEAD`
   UPSTREAM=`git for-each-ref --format='%(upstream:short)' "$REF"`
   [ "$UPSTREAM" == "" ] && UPSTREAM="master"
   echo "$UPSTREAM"
}

SHOWCLFMTARGS="--color --graph --oneline --decorate"
COL0="\e[0;33m"
COL1="\e[1;31m"
COL2="\e[1;33m"
COLGR="\e[1;32m"
COLn="\033[0m"

function show_with_tag {
   last=`git log -1 $SHOWCLFMTARGS $1` echo -e "$last ${COL0}(${COL2}$2${COL0})${COLn}"
}
