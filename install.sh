#!/bin/bash

DIRNAME=$(dirname $0)

function Usage()
{
    cat <<-EOF
		Install the config files of myself.

		Usage: `basename $0` [选项]
		选项 :
		       --bash      Install bash config files.
		       --emacs     Install emacs config files.
		       --vim       Install vim config files.
               --git       Config git.
               --dev       Install development tools.
		       --a         Install all of them.
		       --help      Show this help.
	EOF
}

function InstallBashConfigFiles()
{
    for FILE in `ls | grep ^bash`
    do
	cp -v $FILE ~/".$FILE"
    done
    echo
}
function InstallVimConfigFiles()
{
    if [ -f $DIRNAME/vim/vimrc ]; then
	    cp -v $DIRNAME/vim/vimrc ~/.vimrc
    else
	    exit
    fi
    echo
}
function InstallEmacsConfigFiles()
{
    if [ -d $DIRNAME/emacs ]; then
	    cp -vr $DIRNAME/emacs/* ~/.emacs.d
    fi
    echo
}
function InstallDevTools()
{
    sudo apt update && sudo apt install git qt5-default \
        build-essential evince typora
}
function ConfigGit()
{
    git config --global user.name pdyang
    git config --global user.email impdyang@163.com
}

case "$1" in
	--[Bb][Aa][Ss][Hh]		)
		InstallBashConfigFiles
		exit 0
        ;;
	--[Ee][Mm][Aa][Cc][Ss]	)
		InstallEmacsConfigFiles
		exit 0
        ;;
	--[Vv][Ii][Mm]			)
		InstallVimConfigFiles
		exit 0
        ;;
    --[Dd][Ee][Vv]          )
        InstallDevTools
        exit 0
        ;;
    --[Gg][Ii][Tt]          )
        ConfigGit
        exit 0
        ;;
	-a | ""                 )
		InstallBashConfigFiles
		InstallEmacsConfigFiles
		InstallVimConfigFiles
        InstallDevTools
        ConfigGit
		exit 0
        ;;
	*						)
		Usage
		exit 0
        ;;
esac
