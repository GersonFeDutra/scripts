Y=""


# while getopts 'abf:v' flag; do
# 	case "${flag}" in
# 		y) Y="-y" ;;
# 		*) exit 1 ;;
# 	esac
# done

if [ $1 = "-y" ]; then
	Y="-y"
fi

apt-get update $Y
echo ""
apt-get upgrade $Y
echo ""
apt-get autoremove $Y
echo ""

echo ""

apt update $Y
echo ""
apt upgrade $Y
echo ""
apt autoremove $Y
