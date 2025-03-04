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

echo "build Python"
cd "$BaseDir"
pwd

filename="Python-3.11.0.tgz"
download_url="https://www.python.org/ftp/python/3.11.0/${filename}"
directory="Python-3.11.0"

if [ -f "$filename" ]; then
    read -p "File $filename exists. Do you want to delete and re-download it? (y/n)" yn
    case $yn in
        [Yy]* ) rm $filename; wget $download_url;;
        [Nn]* ) echo "Using existing file.";;
        * ) echo "Please answer yes or no.";;
    esac
else
    wget $download_url
fi

if [ -d "$directory" ]; then
    read -p "Directory $directory exists. Do you want to delete it and unzip the file again? (y/n)" yn
    case $yn in
        [Yy]* ) rm -r $directory; tar xzf $filename;;
        [Nn]* ) echo "Using existing directory.";;
        * ) echo "Please answer yes or no.";;
    esac
else
    tar xzf $filename
fi

cd $directory

./configure --prefix=$LocalDir --enable-optimizations -enable-shared --with-ensurepip=install --enable-loadable-sqlite-extensions --with-openssl=${LocalDir} --with-openssl-rpath=${LocalDir}/lib
make -j `nproc`
make altinstall

# Add symbolic link for Python3
PYTHON_BIN_DIR=$LocalDir/bin
if [ -f "${PYTHON_BIN_DIR}/python3" ]; then
    echo "The symbolic link 'python3' already exists. Removing..."
    rm "${PYTHON_BIN_DIR}/python3"
fi
echo "Creating new symbolic link 'python3' for Python3.11"
ln -s ${PYTHON_BIN_DIR}/python3.11 ${PYTHON_BIN_DIR}/python3

cd ..

