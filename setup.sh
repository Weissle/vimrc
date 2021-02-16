#!/bin/bash
echo "This script is for neovim and work well on ubuntu, maybe it can work as well as other linux system."

STORE_PATH_BASE=.local/myvim
STORE_PATH="$HOME/$STORE_PATH_BASE"
NODEJS_URL="https://npm.taobao.org/mirrors/node/v14.15.4/node-v14.15.4-linux-x64.tar.xz"
CLANGD_URL="https://github.com/clangd/clangd/releases/download/11.0.0/clangd-linux-11.0.0.zip"
FORCE_CLANGD=false
FORCE_NODEJS=false
QUIET=false

Echo(){
	if [ "$QUIET" = false ] ; then
		echo $@
	fi
}

check_software(){
	if ! type "$1" > /dev/null; then
		if [ "$2" = true ]; then
			echo "You have not install $1 and it is necessary. Please install it and rerun this script."
			exit 1
		else
			echo "You have not install $1 and the installation may fail."
		fi
	fi
}

TEMP_OPT=`getopt -o q --long clangd,nodejs \
			-n "test.sh" -- "$@"`

if [ $? != 0 ]; then
	echo "Error when parsing arguments.";
	exit 1;
fi
eval set -- "$TEMP_OPT"
while true ; do
	case "$1" in
		-q) QUIET=true ; shift ;;
		--clangd) FORCE_CLANGD=true ; shift ;;
		--nodejs) FORCE_NODEJS=true ; shift ;;
		--) shift ; break ;;
		*) echo "Unknown option" ; exit 1 ;;
	esac
done

check_software "nvim" true

mkdir -p ~/.local/share/nvim/site/autoload/
cp ./other/plug.vim  ~/.local/share/nvim/site/autoload/plug.vim
nvim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"



check_software "git"
check_software "unzip"
check_software "curl"
check_software "wget"


mkdir "${STORE_PATH}/bin" -p
cd "${STORE_PATH}" || exit 1

if [ -z "$(which clangd)" ]; then
	echo "Installing clangd"
	wget -O clangd.zip "$CLANGD_URL"
	unzip clangd.zip -d ./clangd
	find "${STORE_PATH}/clangd/" -wholename "*bin/clangd*" -exec ln -s {} ./bin/. ';' ;
	rm clangd.zip
fi

if  [ -z "$(which npm)" ] || [ -z "$(which node)" ]; then
	echo "Installing nodejs"
	wget -O node.tar.xz $NODEJS_URL
	mkdir node -p
	tar -Jxf node.tar.xz -C ./node
	find "${STORE_PATH}/node/" -wholename "*x64/bin/n*" -exec ln -s {} ./bin/. ';' ;
	rm node.tar.xz
fi
PATH_STR="export PATH=\"\$PATH:$STORE_PATH/bin\"" 
if [ -z "$(cat ~/.bashrc | grep "$PATH_STR")" ] ; then
	echo "PATH_STR">> ~/.bashrc
fi
