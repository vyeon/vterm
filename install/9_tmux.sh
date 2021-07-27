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

echo "build $tmux"
cd "$BaseDir/$tmux"
pwd
echo "inc: $LocalInc"
./configure --prefix=$LocalDir CPPFLAGS="-I$LocalInc -I$LocalInc/ncurses" CFLAGS="-I$LocalInc -I$LocalInc/ncurses" LDFLAGS="-L$LocalLib"
make -j `nproc`
make install
cd ..
