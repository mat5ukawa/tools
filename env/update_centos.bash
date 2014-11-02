#!/bin/bash

wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm
rpm -Uvh rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm
sudo yum install -y terminator
sudo yum install -y git
git clone https://github.com/mat5ukawa/tools.git
cp tools/env/.vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc
wget http://levien.com/type/myfonts/Inconsolata.pfa
sudo yum install -y ibus-anthy
curl -L https://get.rvm.io | bash -s stable --autolibs=enabled
source ~/.profile
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt
source ~/.bash-git-prompt/gitprompt.sh
rvm install 2.0
LANG=C xdg-user-dirs-gtk-update

git config --global user.name "Yusuke Matsukawa"
git config --global user.email "mat27y@gmail.com"
git config --global color.ui true
git config --global merge.ff false
