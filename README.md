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

## Generate compile_commands.json
```
# Two ways to generate compile_commands.json
# 1.   In project root.
mkdir -p build && cd build && cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ../${SRC_FOLDER}
# 2.   In makefile folder
bear make
#link compile_commands.json to project root
ln -s compile_commands.json {PROJECT_ROOT}/.
```
