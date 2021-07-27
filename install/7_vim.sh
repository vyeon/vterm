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

GetPythonConfigDir() {
	local __result=$1
	local LibDir=$(find $LocalLib -maxdepth 1 -type d | grep "python3")
	#echo "> LibDir: $LibDir"
	local ConfigDir=$(find $LibDir -maxdepth 1 -type d | grep "config-")
	#echo "> ConfigDir: $ConfigDir"
	if [[ "$__result" ]]; then
		eval $__result=$ConfigDir
	else
		echo #ConfigDir
	fi
}

echo "build $vim"
cd "$BaseDir/$vim"
pwd
GetPythonConfigDir Py3ConfDir
echo "Python3 config directory: $Py3ConfDir"
env LDFLAGS="-L$LocalLib" \
./configure \
	--with-features=huge \
	--enable-multibyte \
	--enable-rubyinterp=yes \
	--enable-python3interp=yes \
	--with-python3-config-dir=$Py3ConfDir \
	--enable-perlinterp=yes \
	--enable-luainterp=yes \
	--enable-cscope \
	--with-tlib=ncurses \
	--prefix=$LocalDir
make -j `nproc`
make install
cd ..
