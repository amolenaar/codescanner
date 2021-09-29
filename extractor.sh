test -z "$1" && { echo "Usage: $0 <path-to-repo>"; exit 1; }

cd $1

git log --format=format:"::: %H %ci" --numstat --no-renames | \
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
