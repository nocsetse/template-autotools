#!/bin/bash

# 06/06/2022 Python 3.10.x installer script 

# Author:  2730246+devsecfranklin@users.noreply.github.com 

PYTHON_VERSION="3.10.5"

function install_python() {
    if [ ! -d "Python-${PYTHON_VERSION}" ]; then
        
        if [ ! -f "Python-${PYTHON_VERSION}.tar" ]; then
            if [ ! -f "Python-${PYTHON_VERSION}.tar.xz" ]; then
                wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tar.xz
                echo "Downloading Python ${PYTHON_VERSION} source"
            fi    
            unxz Python-${PYTHON_VERSION}.tar.xz
            echo "Unxz the Python source"
        fi
        tar xf Python-${PYTHON_VERSION}.tar
        echo "untar the Python ${PYTHON_VERSION} source"
    fi

    cd Python-${PYTHON_VERSION}
    echo "Configure the Python ${PYTHON_VERSION} source"
    ./configure --enable-optimizations
    echo "Doing make install"
    sudo make install
}

function main() {
    install_python
}
main
