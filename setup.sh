#! /bin/bash
set -euxo pipefail
cd "$(dirname "$0")"

sudo apt update && sudo apt upgrade
sudo apt install \
    git \
    vim \
    jq

# install OpenCV
sudo apt install \
    libopencv-dev \
    python3-opencv

echo 'export LD_PRELOAD=/usr/lib/arm-linux-gnueabihf/libatomic.so.1' >>~/.bashrc
/usr/bin/python3 -m pip install -U pip setuptools wheel
/usr/bin/python3 -m pip install \
    black \
    isort 

# SSH Basic Configs
mkdir ~/.ssh
touch ~/.ssh/authorized_keys
chmod 700 ~/.ssh
echo 'COPY PUB KEY TO ~/.ssh/authorized_keys'


# set ~/.vimrc
curl -sSL https://raw.githubusercontent.com/straxFromIbr/SetUpPI/main/vimrc > ./vimrc
if ! test -e ~/.vimrc; then
    mv ./vimrc ~/.vimrc
fi
rm ./vimrc
