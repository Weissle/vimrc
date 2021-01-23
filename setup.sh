mkdir -p ~/.local/share/nvim/site/autoload/
cp ./other/plug.vim  ~/.local/share/nvim/site/autoload/plug.vim
nvim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"
