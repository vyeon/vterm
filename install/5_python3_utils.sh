source ./_env.sh
PrintEnv

# Install psutil and bpytop
$LocalDir/bin/python3.11 -m pip install --no-binary :all: git+https://github.com/giampaolo/psutil.git
$LocalDir/bin/python3.11 -m pip install git+https://github.com/aristocratos/bpytop.git
