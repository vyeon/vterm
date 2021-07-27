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

echo "build $openssl"
cd "$BaseDir/$openssl"
pwd
./config --prefix=$LocalDir --with-zlib-include=$LocalInc --with-zlib-lib=$LocalLib shared zlib
make -j `nproc`
make install
cd ..
