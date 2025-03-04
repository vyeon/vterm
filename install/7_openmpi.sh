#!/bin/bash

# openmpi.sh

source ./_env.sh

PrintEnv
BaseDir="${ScriptDir}/tmp"

if [ -d ${BaseDir} ]; then
    cd "${BaseDir}"
else
    echo "A working directory 'tmp' does not exist!"
    exit 1
fi

echo "build openmpi"
cd "$BaseDir"
pwd

filename="openmpi-4.1.1.tar.gz"
download_url="https://download.open-mpi.org/release/open-mpi/v4.1/${filename}"
directory="openmpi-4.1.1"

if [ -f "$filename" ]; then
    read -p "File $filename exists. Do you want to delete and re-download it? (y/n) " yn
    case $yn in
        [Yy]* ) rm $filename; wget $download_url;;
        [Nn]* ) echo "Using existing file.";;
        * ) echo "Please answer yes or no.";;
    esac
else
    wget $download_url
fi

if [ -d "$directory" ]; then
    read -p "Directory $directory exists. Do you want to delete it and unzip the file again? (y/n) " yn
    case $yn in
        [Yy]* ) rm -r $directory; tar xvzf $filename;;
        [Nn]* ) echo "Using existing directory.";;
        * ) echo "Please answer yes or no.";;
    esac
else
    tar xvzf $filename
fi

cd $directory

./configure --prefix=$LocalDir
make -j $(nproc)
make install
cd ..

