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

echo "build $libffi"
cd "$BaseDir/$libffi"
pwd
#./autogen.sh
#mv ../ltmain.sh ./
#./autogen.sh
./configure --prefix=$LocalDir --disable-static
make -j `nproc`
make install
cd ..
