# vimrc
my vimrc

Additional Action:
```
#After coc-tabnine installed
:CocCommand
choose tabnine.openConfig
set "ignore_all_lsp" : true.
```
## Install CTag
https://github.com/universal-ctags/ctags  

## CTag for STL
```
#Go to /usr/include/c++  maybe different for various os
ctags -R --c++-kinds=+p --fields=+iaS --extras=+q ${STL_FOLDER}
mv tags stl.tags
```

## CTag for ROS

```
#Go to /usr/include/c++  maybe different for various os
ctags -R --c++-kinds=+p --fields=+iaS --extras=+q ${ROS_FOLDER}
mv tags ros.tags
```

## Enable system clipboard
```
sudo apt install xclip
```
