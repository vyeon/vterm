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

echo "build $libevent"
cd "$BaseDir/$libevent"
pwd
./autogen.sh
./configure --prefix=$LocalDir --disable-openssl
make -j `nproc`
make install
cd ..
