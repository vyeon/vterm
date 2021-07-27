source ./_package_list.sh

if [ -d "tmp" ]; then
	echo "a directory tmp exists"
	exit
else
	mkdir tmp
fi

cd tmp

# m4

if [ -e "$m4.tar.gz" ]; then
	echo "$m4.tar.gz exists"
else
	wget https://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.gz
fi

if [ -d "$m4" ]; then
	echo "a directory $m4 exists"
else
	echo "unzip $m4.tar.gz"
	tar -zxf $m4.tar.gz
fi

# libtool

if [ -e "$libtool.tar.gz" ]; then
	echo "$libtool.tar.gz exists"
else
	wget https://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.gz
fi

if [ -d "$libtool" ]; then
	echo "a directory $libtool exists"
else
	echo "unzip $libtool.tar.gz"
	tar -zxf $libtool.tar.gz
fi

# automake

if [ -e "$automake.tar.gz" ]; then
	echo "$automake.tar.gz exists"
else
	wget https://ftp.gnu.org/gnu/automake/automake-1.16.1.tar.gz
fi

if [ -d "$automake" ]; then
	echo "a directory $automake exists"
else
	echo "unzip $automake.tar.gz"
	tar -zxf $automake.tar.gz
fi

# autoconf

if [ -e "$autoconf.tar.gz" ]; then
	echo "$autoconf.tar.gz exists"
else
	wget https://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
fi

if [ -d "$autoconf" ]; then
	echo "a directory $autoconf exists"
else
	echo "unzip $autoconf.tar.gz"
	tar -zxf $autoconf.tar.gz
fi

# pkgconf

if [ -e "$pkgconf.tar.gz" ]; then
	echo "$pkgconf.tar.gz exists"
else
	wget https://github.com/pkgconf/pkgconf/releases/download/pkgconf-1.0.1/pkgconf-1.0.1.tar.gz
fi

if [ -d "$pkgconf" ]; then
	echo "a directory $pkgconf exists"
else
	echo "unzip $pkgconf.tar.gz"
	tar -zxf $pkgconf.tar.gz
fi

# gettext

if [ -e "$gettext.tar.gz" ]; then
	echo "$gettext.tar.gz exists"
else
	wget https://ftp.gnu.org/gnu/gettext/gettext-0.19.8.tar.gz
fi

if [ -d "$gettext" ]; then
	echo "a directory $gettext exists"
else
	echo "unzip $gettext.tar.gz"
	tar -zxf $gettext.tar.gz
fi

# gcc7

if [ -e "$gcc7.tar.gz" ]; then
	echo "$gcc7.tar.gz exists"
else
    wget https://ftp.gnu.org/gnu/gcc/gcc-7.4.0/gcc-7.4.0.tar.gz
fi

if [ -d "$gcc7" ]; then
	echo "a directory $gcc7 exists"
else
	echo "unzip $gcc7.tar.gz"
	tar -zxf $gcc7.tar.gz
fi

# gcc6

if [ -e "$gcc6.tar.gz" ]; then
	echo "$gcc6.tar.gz exists"
else
    wget https://ftp.gnu.org/gnu/gcc/gcc-6.5.0/gcc-6.5.0.tar.gz
fi

if [ -d "$gcc6" ]; then
	echo "a directory $gcc6 exists"
else
	echo "unzip $gcc6.tar.gz"
	tar -zxf $gcc6.tar.gz
fi

# zlib

if [ -e "$zlib.tar.gz" ]; then
	echo "$zlib.tar.gz exists"
else
	wget https://www.zlib.net/zlib-1.2.11.tar.gz
fi

if [ -d $zlib ]; then
	echo "a directory $zlib exists"
else
	echo "unzip $zlib.tar.gz"
	tar -zxf $zlib.tar.gz
fi

# openssl

if [ -e "$openssl.tar.gz" ]; then
	echo "$openssl.tar.gz exists"
else
	echo 
	wget https://www.openssl.org/source/openssl-1.0.2q.tar.gz
fi

if [ -d $openssl ]; then
	echo "a directory $openssl exists"
else
	echo "unzip $openssl.tar.gz"
	tar -zxf $openssl.tar.gz
fi

# libffi

if [ -e "$libffi.tar.gz" ]; then
	echo "$libffi.tar.gz exists"
else
	wget https://github.com/libffi/libffi/releases/download/v3.3-rc0/libffi-3.3-rc0.tar.gz
fi

if [ -d $libffi ]; then
	echo "a directory $libffi exists"
else
	echo "unzip $libffi.tar.gz"
	tar -zxf $libffi.tar.gz
fi

# python3

if [ -e "$python3.tgz" ]; then
	echo "$python3.tgz exists"
else
	wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz
fi

if [ -d $python3 ]; then
	echo "a directory $python3 exists"
else
	echo "unzip $python3.tgz"
	tar -zxf $python3.tgz
fi

# vim

if [ -d $vim ]; then
	echo "a directory $vim exists"
else
	echo "clone $vim from official vim repository"
	git clone https://github.com/vim/vim.git
fi

# ncurses
if [ -d $ncurses ]; then
	echo "a directory $ncurses exists"
else
	echo "clone $ncurses from the ncurses Git mirror"
	git clone https://github.com/mirror/ncurses.git
fi

# libevent
if [ -d $libevent ]; then
	echo "a directory $libevent exists"
else
	echo "clone $libevent from the libevent Git mirror"
	git clone https://github.com/libevent/libevent.git
fi

# tmux

if [ -e "$tmux.tar.gz" ]; then
	echo "$tmux.tar.gz exists"
else
	wget https://github.com/tmux/tmux/releases/download/3.2a/tmux-3.2a.tar.gz
fi

if [ -d $tmux ]; then
	echo "a directory $tmux exists"
else
	echo "unzip $tmux-3.2a.tar.gz"
	tar -zxf $tmux.tar-3.2a.gz
fi

# cmake

if [ -e "$cmake.tar.gz" ]; then
	echo "$cmake.tar.gz exists"
else
    wget https://github.com/Kitware/CMake/releases/download/v3.14.0-rc2/cmake-3.14.0-rc2.tar.gz
fi

if [ -d $cmake ]; then
	echo "a directory $cmake exists"
else
	echo "unzip $cmake.tar.gz"
	tar -zxf $cmake.tar.gz
fi

# Z3
if [ -d $clang ]; then
	echo "a directory $Z3 exists"
else
	echo "clone $Z3 from the Z3 Git mirror"
    git clone https://github.com/Z3Prover/z3.git
fi

# clang
if [ -d $clang ]; then
	echo "a directory $clang exists"
else
	echo "clone $clang from the llvm-project Git mirror"
    git clone https://github.com/llvm/llvm-project.git
fi


