echo "This script is for neovim and work well on ubuntu, maybe it can work as well as other linux system."

mkdir -p ~/.local/share/nvim/site/autoload/
cp ./other/plug.vim  ~/.local/share/nvim/site/autoload/plug.vim
nvim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"

LACK_SOFTWARE=false
if ! type "unzip" > /dev/null; then
	echo "You should install unzip"
	LACK_SOFTWARE=true
fi
if ! type "curl" > /dev/null; then
	echo "You should install curl"
	LACK_SOFTWARE=true
fi
if ! type "wget" > /dev/null; then
	echo "You should install wget"
	LACK_SOFTWARE=true
fi
if ! type "git" > /dev/null; then
	echo "You should install git"
	LACK_SOFTWARE=true
fi
if $LACK_SOFTWARE ; then
	echo "prerequisites are not satisfied"
	exit 1
fi
STORE_PATH=~/.local/myvim
mkdir ${STORE_PATH}/bin -p
cd ${STORE_PATH}

if [ ! -f "${STORE_PATH}/bin/clangd" ]; then
	if [ $(which clangd) != "" ]; then
		ln -s $(which clangd) ~/.local/myvim/bin/clangd
	else
		echo "Installing clangd"
		CLANGD_URL=$(curl -s https://api.github.com/repos/clangd/clangd/releases/latest \
				|  grep browser_download_url \
				|  grep linux\
				|  cut -d '"' -f 4
		)
		echo $CLANGD_URL
		wget -O clangd.zip $CLANGD_URL
		unzip clangd.zip -d ./clangd
		CLANGD_BINS=$(find ${STORE_PATH}/clangd/ | grep "bin/clangd")
		ln -s $CLANGD_BINS ${STORE_PATH}/bin/.
	fi
fi

if [ ! -f "${STORE_PATH}/bin/node" -o ! -f "${STORE_PATH}/bin/npm" ]; then
	if [ $(which npm) != "" -a $(which node) != ""  ]; then
		ln -s $(which npm) ~/.local/myvim/bin/npm
		ln -s $(which node) ~/.local/myvim/bin/node
	else
		echo "Installing nodejs"
		wget -O node.tar.xz https://npm.taobao.org/mirrors/node/v14.15.4/node-v14.15.4-linux-x64.tar.xz
		mkdir node -p
		tar -Jxf node.tar.xz -C ./node
		NODE_BINS=$(find ${STORE_PATH}/node/ | grep "x64/bin/")
		ln -s $NODE_BINS ${STORE_PATH}/bin/.
	fi
fi

echo "export PATH=\"\$PATH:~/.local/myvim/bin\"" >> ~/.bashrc
