#!/bin/bash

dirname=$(dirname $0)

function printMenu() {
    echo -e "\t\tInstall Configuration Files"
}

function installConfigFiles() {
    for file in `ls | grep ^bash`
    do
        cp -v $file ~/".$file"
    done

    if [ -f $dirname/vim/vimrc ]; then
        cp -v $dirname/vim/vimrc ~/.vimrc
    fi

    if [ -d $dirname/emacs ]; then
	cp -vr $dirname/emacs/* ~/.emacs.d
    fi
}

printMenu

installConfigFiles
