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
	sed 's/    /\t/g' $1 > $2
}

