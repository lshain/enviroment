#!/bin/bash

function android_gen_tags( ) 
{
	MY_ANDROID_ROOT=$PWD
	MY_ANDROID_VERSION=4
	
	if [ $# -gt 0 ]; then
		MY_ANDROID_VERSION=$1
	fi

	CONFIRM=n
	read -p "index gtags files in ${MY_ANDROID_ROOT}? (y/n) " CONFIRM

	if [ "$CONFIRM" != "y" ]; then
		echo "goodbye"
		exit 0
	fi

	MY_SUBDIRS=""
	MY_OUT_DIRS=""
	DONT_CARE_DIRS=""
	if [ $MY_ANDROID_VERSION -eq 4 ]; then
		MY_SUBDIRS="abi frameworks system bionic dalvik libcore development/samples/ApiDemos external/skia  hardware packages/apps/Settings"
		MY_OUT_DIRS="out/target/common/obj/JAVA_LIBRARIES"
		DONT_CARE_DIRS="libnativehelper"
	else
		MY_SUBDIRS="frameworks system bionic dalvik development/samples/ApiDemos external/skia hardware packages/apps/Settings"
		MY_OUT_DIRS="out/target/common/obj/JAVA_LIBRARIES"
	fi

	for dir in ${MY_SUBDIRS}; do
		if [ ! -e ${MY_ANDROID_ROOT}/${dir} ]; then
			echo "subdir $dir not found, please run this script in Android root directory"
			exit 1
		fi
	done

	for dir in ${MY_OUT_DIRS}; do
		if [ -e ${MY_ANDROID_ROOT}/${dir} ]; then
			MY_SUBDIRS="$MY_SUBDIRS $dir"
		fi
	done

	for dir in ${DONT_CARE_DIRS}; do
		if [ -e ${MY_ANDROID_ROOT}/${dir} ]; then
			MY_SUBDIRS="$MY_SUBDIRS $dir"
		fi
	done

	rm gtags.files GTAGS GPATH GRTAGS >/dev/null 2>&1
	rm cscope.files  cscope.in.out  cscope.out  cscope.po.out >/dev/null 2>&1

	while :; do
		echo -n "#"
		sleep 1
	done &

	PROGRESS_BAR=$!

	trap 'kill $PROGRESS_BAR; exit 0' TERM INT

	for dir in ${MY_SUBDIRS}; do
		find -L ${MY_ANDROID_ROOT}/${dir}  -name .repo -prune -o -name .git -prune -o \
			-type f \( -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name '*.h' -o -name '*.java' \) -print >>${MY_ANDROID_ROOT}/gtags.files
	done

	for dir in ${MY_SUBDIRS}; do
		find -L ${MY_ANDROID_ROOT}/${dir}  -name .repo -prune -o -name .git -prune -o \
			-type f \( -name '*.c' -o -name '*.h' \) -print >>${MY_ANDROID_ROOT}/cscope.files
	done

	export GTAGSFORCECPP="yes"
	gtags -f ${MY_ANDROID_ROOT}/gtags.files
	cscope -b -q -k

	kill $PROGRESS_BAR
	echo
}

function kernel_gen_tags( ) 
{
        MY_KERNEL_ROOT=$PWD

        CONFIRM=n
        read -p "index gtags files in ${MY_KERNEL_ROOT}? (y/n) " CONFIRM

        if [ "$CONFIRM" != "y" ]; then
                echo "goodbye"
                exit 0
        fi

        MY_SUBDIRS="arch crypto drivers fs init kernel mm samples security tools virt block firmware include ipc lib net scripts sound usr"
        DONT_CARE_DIRS=""

        for dir in ${MY_SUBDIRS}; do
                if [ ! -e ${MY_KERNEL_ROOT}/${dir} ]; then
                        echo "subdir $dir not found, please run this script in Android root directory"
                        exit 1
                fi
        done

        for dir in ${DONT_CARE_DIRS}; do
                if [ -e ${MY_KERNEL_ROOT}/${dir} ]; then
                        MY_SUBDIRS="$MY_SUBDIRS $dir"
                fi
        done

        rm cscope.files  cscope.in.out  cscope.out  cscope.po.out >/dev/null 2>&1

        while :; do
                echo -n "#"
                sleep 1
        done &

        PROGRESS_BAR=$!

        trap 'kill $PROGRESS_BAR; exit 0' TERM INT

        for dir in ${MY_SUBDIRS}; do
                find -L ${MY_KERNEL_ROOT}/${dir}  -name .repo -prune -o -name .git -prune -o \
                        -type f \( -name '*.c' -o -name '*.h' \) -print >>${MY_KERNEL_ROOT}/cscope.files
        done

        export GTAGSFORCECPP="yes"
        cscope -b -q -k

        kill $PROGRESS_BAR
        echo
}


function source_gen_tags( ) 
{
	MY_SOURCE_ROOT=$PWD

	CONFIRM=n
	read -p "index gtags files in ${MY_SOURCE_ROOT}? (y/n) " CONFIRM

	if [ "$CONFIRM" != "y" ]; then
		echo "goodbye"
		sleep 2
		exit 0
	fi

	if [ 0 == "$#" ]; then
	        echo "no param!"
	        sleep 2
                exit 0
	fi
	
	MY_SUBDIRS="$*"
	MY_OUT_DIRS=""
	DONT_CARE_DIRS=""

	for dir in ${MY_SUBDIRS}; do
		if [ ! -e ${MY_SOURCE_ROOT}/${dir} ]; then
			echo "subdir $dir not found!"
			exit 1
		fi
	done

	for dir in ${MY_OUT_DIRS}; do
		if [ -e ${MY_SOURCE_ROOT}/${dir} ]; then
			MY_SUBDIRS="$MY_SUBDIRS $dir"
		fi
	done

	for dir in ${DONT_CARE_DIRS}; do
		if [ -e ${MY_SOURCE_ROOT}/${dir} ]; then
			MY_SUBDIRS="$MY_SUBDIRS $dir"
		fi
	done

	rm gtags.files GTAGS GPATH GRTAGS >/dev/null 2>&1
	rm cscope.files  cscope.in.out  cscope.out  cscope.po.out >/dev/null 2>&1

	while :; do
		echo -n "#"
		sleep 1
	done &

	PROGRESS_BAR=$!

	trap 'kill $PROGRESS_BAR; exit 0' TERM INT

	for dir in ${MY_SUBDIRS}; do
		find -L ${MY_SOURCE_ROOT}/${dir}  -name .repo -prune -o -name .git -prune -o \
			-type f \( -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name '*.h' -o -name '*.java' \) -print >>${MY_SOURCE_ROOT}/gtags.files
	done

	for dir in ${MY_SUBDIRS}; do
		find -L ${MY_SOURCE_ROOT}/${dir}  -name .repo -prune -o -name .git -prune -o \
			-type f \( -name '*.c' -o -name '*.h' \) -print >>${MY_SOURCE_ROOT}/cscope.files
	done

	export GTAGSFORCECPP="yes"
	gtags -f ${MY_SOURCE_ROOT}/gtags.files
	cscope -b -q -k

	kill $PROGRESS_BAR
	echo
}
