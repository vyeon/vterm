echo "VTERM Installation Environment Variables"
LocalDir="${HOME}/local"
LocalBin="${LocalDir}/bin"
LocalSBin="${LocalDir}/sbin"
LocalInc="${LocalDir}/include"
LocalLib="${LocalDir}/lib"
LocalLib64="${LocalDir}/lib64"
ScriptDir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

PrintEnv() {
	echo "LocalDir: ${LocalDir}"
	echo "LocalBin: ${LocalBin}"
	echo "LocalInc: ${LocalInc}"
	echo "LocalLib: ${LocalLib}"
	echo "LocalLib64: ${LocalLib64}"
	echo "ScriptDir: ${ScriptDir}"
}

PATH="${LocalBin}:${LocalSBin}:${PATH}"
LD_LIBRARY_PATH="${LocalLib64}:${LocalLib}:${LD_LIBRARY_PATH}"

#PrintEnv
