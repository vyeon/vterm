source ./_env.sh

PrintEnv
BaseDir="${ScriptDir}/tmp"

if [ -d ${BaseDir} ]; then
    cd "${BaseDir}"
else
    echo "A working directory 'tmp' does not exist!"
    exit 1
fi

echo "build OpenSSL"
cd "$BaseDir"
pwd

OpenSSLVersion="openssl-1.1.1u"
download_url="https://www.openssl.org/source/${OpenSSLVersion}.tar.gz"

if [ -f "${OpenSSLVersion}.tar.gz" ]; then
    read -p "File ${OpenSSLVersion}.tar.gz exists. Do you want to delete and re-download it? (y/n)" yn
    case $yn in
        [Yy]* ) rm "${OpenSSLVersion}.tar.gz"; wget $download_url;;
        [Nn]* ) echo "Using existing file.";;
        * ) echo "Please answer yes or no.";;
    esac
else
    wget $download_url --no-check-certificate
fi

if [ -d "${OpenSSLVersion}" ]; then
    read -p "Directory ${OpenSSLVersion} exists. Do you want to delete it and unzip the file again? (y/n)" yn
    case $yn in
        [Yy]* ) rm -r "${OpenSSLVersion}"; tar xvzf "${OpenSSLVersion}.tar.gz";;
        [Nn]* ) echo "Using existing directory.";;
        * ) echo "Please answer yes or no.";;
    esac
else
    tar xvzf "${OpenSSLVersion}.tar.gz"
fi

cd ${OpenSSLVersion}

./config --prefix=${LocalDir} --openssldir=${LocalDir} shared zlib
make -j
make test
make install

cd ..
