#!/bin/bash

DIRNAME=$(dirname $0)

function Usage()
{
    cat <<-EOF
		Install the config files of myself.

		Usage: `basename $0` [选项]
		选项 :
          --var       Install envars file.
          --bash      Install bash config files.
          --vim       Install vim config files.
          --git       Config git.
          --dev       Install development tools.
          --a         Install all of them.
          --help      Show this help.
EOF
}

function InstallEnvars() {
  if [ -f ./envars ]; then
    cp -v ./envars $HOME/.envars 
  fi
  cat <<EOF >> $HOME/.profile
    if [ -f $HOME/.envars ]; then
      . $HOME/.envars
    fi
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
function InstallDevTools()
{
    DTK_DEVS=`apt list | grep '^libdtk' | cut -d '/' -f 1 | grep -v 'dbgsym$' | tr '\n' ' '`
    CPP_DEVS="build-essential git"
	TOOL_APPS="evince nautilus-nutstore"
    sudo apt install $CPP_DEVS $DTK_DEVS $TOOL_APPS -y
}

function ConfigGit()
{
    git config --global user.name pdyang
    git config --global user.email impdyang@163.com
}

case "$1" in
  --[Ee][Nn][Vv][Aa][Rr][Ss]  )
    InstallEnvars
    exit 0
        ;;
	--[Bb][Aa][Ss][Hh]		)
		InstallBashConfigFiles
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
        InstallEnvars
        InstallBashConfigFiles
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
