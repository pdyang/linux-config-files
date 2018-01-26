#!/bin/bash

function gitconfig() {
    git config --global user.name pdyang
    git config --global user.email impdyang@163.com
}

if [ -e /usr/bin/git ];
    then
        gitconfig
    else
        sudo apt update && sudo apt install git
        gitconfig
fi
