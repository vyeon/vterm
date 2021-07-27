source ./_package_list.sh
source ./_env.sh

PrintEnv
BaseDir="${ScriptDir}/tmp"

cd tmp

echo "build $pkgconf"
cd "$BaseDir/$pkgconf"
pwd
./configure --prefix=$LocalDir
make -j `nproc`
make install
cd ..
