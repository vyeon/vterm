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

echo "build $cmake"
cd "$BaseDir/$cmake"
pwd
echo "inc: $LocalInc"
./configure --prefix=$LocalDir CXXFLAGS="-I$LocalInc" CFLAGS="-I$LocalInc" LDFLAGS="-L$LocalLib"
make -j `nproc`
make install
cd ..
