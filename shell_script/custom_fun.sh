#!/bin/bash

function touchpad_off( )
{
	synclient touchpadoff=1
}

function touchpad_on( )
{
	synclient touchpadoff=0
}

function ScrollLock_on( )
{
	xset led named 'Scroll Lock'
}

function ScrollLock_off( )
{
	xset -led named 'Scroll Lock'
}

function 4SpaceToTab( )
{
	if [ "$1" != "$2" ]
	then
		sed 's/    /\t/g' $1 > $2
	else
		sed 's/    /\t/g' $1 > $1.bak
		mv $1.bak $1
	fi
}

function ssh_2lshain( )
{
	local url="$HOME/.ssh/id_rsa.lshain_android_source"

	if [ -e "$url" ]
	then
		echo "already 2lshain"
    else
 		mv ~/.ssh/id_rsa ~/.ssh/id_rsa.lshain_android_source
  		mv ~/.ssh/id_rsa.pub ~/.ssh/id_rsa.pub.lshain_android_source
   		mv ~/.ssh/id_rsa.lshain ~/.ssh/id_rsa
    	mv ~/.ssh/id_rsa.pub.lshain ~/.ssh/id_rsa.pub
	fi
}

function ssh_2lshain_android_source( )
{
	local url="$HOME/.ssh/id_rsa.lshain"
	if [ -e "$url" ]
	then
	    echo "already 2lshain_android_source"
	else
        mv ~/.ssh/id_rsa ~/.ssh/id_rsa.lshain
        mv ~/.ssh/id_rsa.pub ~/.ssh/id_rsa.pub.lshain
        mv ~/.ssh/id_rsa.lshain_android_source ~/.ssh/id_rsa
        mv ~/.ssh/id_rsa.pub.lshain_android_source ~/.ssh/id_rsa.pub
	fi
}

