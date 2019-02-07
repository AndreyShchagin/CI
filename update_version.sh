#!/bin/bash
#@ECHO OFF
echo "Update project Version"
echo "---------------------"
#SETLOCAL

function TheBegining(){
    verPostfix="";
    prVer="";
    echo "SNAPSHOT[y/n]?:";
    read verPostfix;
    if [ $verPostfix = "n" ]
    then
	echo "RELEASE[y/n]?:";
	read verPostfix;
	if [ $verPostfix = "n" ]
	then
	    if [ $verPostfix = "n" ]
	    then
		echo "Well then tell me?:";
		read verPostfix;
	    fi
	    #IF %verPostfix% EQU "n" GOTO TellMeThen
	else
	    verPostfix="RELEASE";
	fi
    else
	verPostfix="SNAPSHOT";
    fi
    ApplyPostfix
}

function ApplyPostfix(){
    echo "Input new project's version[X.X.X]?:"
    read prVer
    echo "mvn versions:set -D newVersion="$prVer-$verPostfix
    echo "Ok[y/n]?:"
    read end
    if [ $end != "y" ]
    then
	TheBegining
    else
    #::Be aware - here we go!
    mvn versions:set -DnewVersion=$prVer-$verPostfix
    fi
}

#START here
TheBegining
