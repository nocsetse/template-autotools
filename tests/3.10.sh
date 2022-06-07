#!/bin/bash

# 06/06/2022 Python 3.10.x installer script 

# Author:  2730246+devsecfranklin@users.noreply.github.com 

if [ ! -d "Python-3.10.5" ]; then
    
    if [ ! -f "Python-3.10.5.tar" ]; then
        if [ ! -f "Python-3.10.5.tar.xz" ]; then
            wget https://www.python.org/ftp/python/3.10.5/Python-3.10.5.tar.xz
            echo "Downloading Python 3.10.5 source"
        fi    
        unxz Python-3.10.5.tar.xz
        echo "Unxz the Python source"
    fi
    tar xf Python-3.10.5.tar
    echo "untar the Python source"
fi

cd Python-3.10.5
echo "Configure the Python source"
./configure --enable-optimizations
echo "Doing make altinstall"
sudo make altinstall
