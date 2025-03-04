#!/bin/bash

source ./_env.sh

PrintEnv
BaseDir="${ScriptDir}/tmp"

if [ -d ${BaseDir} ]; then
    cd "${BaseDir}"
else
    echo "A working directory 'tmp' does not exist!"
    exit 1
fi

echo "build vim"
cd "$BaseDir"
pwd

directory="vim"
git_url="https://github.com/vim/vim.git"

if [ -d "$directory" ]; then
    read -p "Directory $directory exists. Do you want to delete it and clone the repo again? (y/n)" yn
    case $yn in
        [Yy]* ) rm -r $directory; git clone $git_url;;
        [Nn]* ) echo "Using existing directory.";;
        * ) echo "Please answer yes or no.";;
    esac
else
    git clone $git_url
fi

cd $directory

echo "inc: $LocalInc"
./configure --prefix=$LocalDir --with-features=huge --enable-pythoninterp=yes --enable-python3interp=yes --with-python3-command=${LocalDir}/bin/python3.11 CPPFLAGS="-I$LocalInc" CFLAGS="-I$LocalInc" LDFLAGS="-L$LocalLib"
make -j `nproc`
make install
cd ..

