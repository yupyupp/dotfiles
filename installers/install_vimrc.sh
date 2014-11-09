#!/bin/bash

cd ../ #Get to root of git repo
DIR=$(pwd)
CTAGS_VERSION=5.8
CTAGS_URL=http://prdownloads.sourceforge.net/ctags/ctags-$CTAGS_VERSION.tar.gz

echo "Cloning submodules"
git submodule update --init --recursive 

echo "Removing old vim congif"
rm ~/.vimrc
rm -r ~/.vim

echo "Copying new vim config"
cp ./.vimrc ~/.vimrc
cp -r ./.vim ~/.vim

# Delete the below section iff you already have Exuberant cTags intalled
echo "Preparing to build Exuberant cTags"
mkdir vim_build
cd vim_build
echo "Downloading source"
wget $CTAGS_URL
echo "Extracting source"
tar -xf ctags-$CTAGS_VERSION.tar.gz
cd ctags-$CTAGS_VERSION
echo "Building ctags from source"
./configure
make
echo "Copying binary"
mkdir ~/.vim/bin
cp ./ctags ~/.vim/bin/ctags

echo "Cleaning up build directories"
rm -rf ./vim_build
# Delete the above section iff you already have Exuberant cTags intalled

echo "Compiling YouCompleteMe dep"
cd ~/.vim/bundle/YouCompleteMe
./install.sh #YouCompleteMe install script
cd

echo "Install finished."
