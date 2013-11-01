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
