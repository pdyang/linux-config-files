#!/bin/bash

dirname=$(dirname $0)

function installConfigFiles() {
    for file in `ls | grep ^bash`
    do
        cp -v $file ~/".$file"
    done

    if [ -f $dirname/vim/vimrc ]; then
        cp -v $dirname/vim/vimrc ~/.vimrc
    fi

    if [ -f $dirname/emacs/init.el ]; then
	cp -v $dirname/emacs/init.el ~/.emacs.d/init.el
    fi
}

installConfigFiles
