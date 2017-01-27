#!/usr/bin/env bash

set -euo pipefail

sudo add-apt-repository ppa:beineri/opt-qt58-trusty
sudo apt-get update
sudo apt-get install gcc-5 g++-5 tree qt58qbs

mkdir -p ~/bin
ln -fs /usr/bin/gcc-5 ~/bin/gcc
ln -fs /usr/bin/g++-5 ~/bin/g++

gcc --version
g++ --version

exit 0
