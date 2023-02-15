ARRAY=( $@ )
LEN=${#ARRAY[@]}

SEARCH="$*"
B_TAG=${ARRAY[$LEN-2]}
BROWSER="microsoft-edge"

if [[ $B_TAG == "-b" ]]
then
	B_ARG=${ARRAY[$LEN-1]}
	SEARCH=${ARRAY[@]:0:$LEN-2}
	if [[ $B_ARG == "brave" ]]
	then
		BROWSER="brave-browser"
	fi
fi

SEARCH="https://duckduckgo.com/?q=${SEARCH//[ ]/+}"
echo $SEARCH

$BROWSER $SEARCH
exit 0
