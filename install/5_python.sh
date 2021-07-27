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

echo "build $python3"
cd "$BaseDir/$python3"
pwd
./configure --prefix=$LocalDir --exec_prefix=$LocalDir --with-openssl="$LocalDir" --with-system-ffi=$LocalDir --enable-shared --enable-optimizations --without-ensurepip
make -j `nproc`
make install
cd ..
