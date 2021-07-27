source ./_package_list.sh

cd tmp

# tmux

if [ -e "$tmux.tar.gz" ]; then
	echo "$tmux.tar.gz exists"
else
	wget https://github.com/tmux/tmux/releases/download/3.2-rc/tmux-3.2-rc2.tar.gz
fi

if [ -d $tmux ]; then
	echo "a directory $tmux exists"
else
	echo "unzip $tmux.tar.gz"
	tar -zxf $tmux.tar.gz
fi


