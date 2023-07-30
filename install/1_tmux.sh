source ./_env.sh

PrintEnv
BaseDir="${ScriptDir}/tmp"

if [ -d ${BaseDir} ]; then
    cd "${BaseDir}"
else
    echo "A working directory 'tmp' does not exist!"
    exit 1
fi

echo "build tmux"
cd "$BaseDir"
pwd

filename="tmux-3.2a.tar.gz"
download_url="https://github.com/tmux/tmux/releases/download/3.2a/${filename}"
directory="tmux-3.2a"

if [ -f "$filename" ]; then
    read -p "File $filename exists. Do you want to delete and re-download it? (y/n)" yn
    case $yn in
        [Yy]* ) rm $filename; wget $download_url;;
        [Nn]* ) echo "Using existing file.";;
        * ) echo "Please answer yes or no.";;
    esac
else
    wget $download_url
fi

if [ -d "$directory" ]; then
    read -p "Directory $directory exists. Do you want to delete it and unzip the file again? (y/n)" yn
    case $yn in
        [Yy]* ) rm -r $directory; tar xvzf $filename;;
        [Nn]* ) echo "Using existing directory.";;
        * ) echo "Please answer yes or no.";;
    esac
else
    tar xvzf $filename
fi

cd $directory

echo "inc: $LocalInc"
./configure --prefix=$LocalDir CPPFLAGS="-I$LocalInc -I$LocalInc/ncurses" CFLAGS="-I$LocalInc -I$LocalInc/ncurses" LDFLAGS="-L$LocalLib"
make -j `nproc`
make install
cd ..
