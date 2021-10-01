#!/usr/bin/bash

set -euo pipefail

test -z "$1" -o -z "$2" && { echo "Usage: $0 <path-to-repo> <after>"; exit 1; }

cd "$1"

git log --format=format:"::: %H %ci" --numstat --no-renames --after="$2" | \
while read A B C
do
    if test "$A" == ":::"
    then
        SHA="$B"
        DATE="$C"
    elif test "$A" != ""
    then
        echo "$DATE,$SHA,$A,$B,$C"
    fi
done
