source ./_package_list.sh
source ./_env.sh

PrintEnv
BaseDir="${ScriptDir}/tmp"

if [ -d ${BaseDir} ]; then
	cd "${BaseDir}"
else
	echo "A working directory 'tmp' does not exist!"
	exit 1
fi

echo "build $gcc7"
cd "$BaseDir/$gcc7"
pwd
./contrib/download_prerequisites
./configure \
        --prefix=$LocalDir \
        --enable-shared \
        --enable-threads=posix \
        --enable-languages=c,c++ \
        --disable-multilib \
        --program-suffix="7"
make -j `nproc`
make install
cd ..

echo "build $gcc6"
cd "$BaseDir/$gcc6"
pwd
./contrib/download_prerequisites
./configure \
        --prefix=$LocalDir \
        --enable-shared \
        --enable-threads=posix \
        --enable-languages=c,c++ \
        --disable-multilib \
        --program-suffix="6"
make -j `nproc`
make install
cd ..

echo "build $m4"
cd "$BaseDir/$m4"
pwd
./configure --prefix=$LocalDir
make -j `nproc`
make install
cd ..

echo "build $libtool"
cd "$BaseDir/$libtool"
pwd
./configure --prefix=$LocalDir
make -j `nproc`
make install
cd ..

echo "build $autoconf"
cd "$BaseDir/$autoconf"
pwd
./configure --prefix=$LocalDir --build=`uname -m`
make -j `nproc`
make install
cd ..

echo "build $automake"
cd "$BaseDir/$automake"
pwd
./configure --prefix=$LocalDir
make -j `nproc`
make install
cd ..

echo "build $gettext"
cd "$BaseDir/$gettext"
pwd
./configure --prefix=$LocalDir
make -j `nproc`
make install
cd ..

cd $LocalBin
ln -s ./gcc7 ./gcc
ln -s ./g++7 ./g++
cd $BaseDir

