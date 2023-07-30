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

echo "build $boost"
cd "$BaseDir/$boost"
pwd
echo "inc: $LocalInc"
./bootstrap.sh --with-libraries=all --with-toolset=gcc
./b2 install --prefix=$LocalDir -j `nproc`
cd ..
