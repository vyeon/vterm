#!/bin/bash

source ./_env.sh
PrintEnv

# Install psutil and bpytop
python3 -m pip install --no-binary :all: git+https://github.com/giampaolo/psutil.git
python3 -m pip install git+https://github.com/aristocratos/bpytop.git

BaseDir="${ScriptDir}/tmp"

if [ -d ${BaseDir} ]; then
    cd "${BaseDir}"
else
    mkdir -p "${BaseDir}"
    cd "${BaseDir}"
fi

echo "build dool"
cd "$BaseDir"
pwd

repository_url="https://github.com/scottchiefbaker/dool.git"
directory="dool"

if [ -d "$directory" ]; then
    read -p "Directory $directory exists. Do you want to delete and re-clone it? (y/n)" yn
    case $yn in
        [Yy]* ) rm -r $directory; git clone $repository_url;;
        [Nn]* ) echo "Using existing directory.";;
        * ) echo "Please answer yes or no.";;
    esac
else
    git clone $repository_url
fi

cd $directory

echo "Installing dool"
./install.py
cd ..
