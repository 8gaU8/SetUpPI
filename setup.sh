#! /bin/bash
set -euxo pipefail
cd "$(dirname "$0")"

sudo apt update && sudo apt upgrade
sudo apt install \
    git \
    vim \
    jq

# install OpenCV Dependencies
sudo apt install \
    libavutil56 \
    libcairo-gobject2 \
    libgtk-3-0 \
    libqtgui4 \
    libpango-1.0-0 \
    libqtcore4 \
    libavcodec58 \
    libcairo2 \
    libswscale5 \
    libtiff5 \
    libqt4-test \
    libatk1.0-0 \
    libavformat58 \
    libgdk-pixbuf2.0-0 \
    libilmbase23 \
    libjasper1 \
    libopenexr23 \
    libpangocairo-1.0-0 \
    libwebp6

command echo 'export LD_PRELOAD=/usr/lib/arm-linux-gnueabihf/libatomic.so.1' >>~/.bashrc

/usr/bin/python3 -m pip install -U pip
/usr/bin/python3 -m pip install \
    black \
    isort \
    opencv-python

# SSH Basic Configs
command mkdir ~/.ssh
command touch ~/.ssh/authorized_keys
command chmod 700 ~/.ssh
command echo 'COPY PUB KEY TO ~/.ssh/authorized_keys'


# set ~/.vimrc
curl -sSL https://raw.githubusercontent.com/straxFromIbr/SetUpPI/main/vimrc > ./vimrc
if ! test -e ~/.vimrc; then
    command mv ./vimrc ~/.vimrc
fi
command rm ./vimrc
