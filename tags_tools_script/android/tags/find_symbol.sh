#!/bin/bash

OBJ_FILES=`find . -name '*.o' -print | xargs grep -l "$1"`

echo "OBJ_FILES = $OBJ_FILES"

for file in $OBJ_FILES; do
	if echo $file | egrep "(built-in|vmlinux)" >/dev/null 2>&1; then
		continue;
	fi
	mips-linux-gnu-objdump -d $file >temp.dump
	if grep "<$1>:" temp.dump >/dev/null 2>&1; then
		echo "Found in $file"
	fi
done

rm -f temp.dump
