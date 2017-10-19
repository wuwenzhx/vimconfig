#!/bin/bash 

#备份OS中vim的配置   
function bakup_vimconfig()
{
	echo "Bakup your vimconfig file..."
	rm   -rf $HOME/.bakvim
	mkdir $HOME/.bakvim
	cp 	  $HOME/.vim  $HOME/.bakvim -a 
	cp 	  $HOME/.vimrc $HOME/.bakvim 
	cp 	  $HOME/.bashrc $HOME/.bakvim 
}

#配置vim
function config_vim()
{
	echo "Config your vim now !"
	rm -rf $HOME/.vim 
	cp ./.vim  $HOME -a 
	cp ./.vimrc $HOME 
	cp ./.bashrc $HOME

	#生成tags文件
	sudo cp ctags /bin 
	echo "Make tags in /usr/include"
	cd /usr/include
	sudo ctags -I __THROW -I __THROWNL -I __nonnull -R --c-kinds=+p --fields=+iaS --extra=+q
}

#设置python补齐
function vim_python_config()
{
    cd ~/vimconfig/ 
    cp pydiction/after/ftplugin/python_pydiction.vim ~/.vim/after/ftplugin 
    cp pydiction/complete-dict ~/.vim
    cp pydiction/pydiction.py ~/.vim

}
bakup_vimconfig
config_vim
vim_python_config
