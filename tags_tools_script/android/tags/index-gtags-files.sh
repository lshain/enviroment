#!/bin/sh

LNX=$PWD

cd $LNX

rm -f GTAGS GRTAGS GPATH gtags.files
rm cscope.files  cscope.in.out  cscope.out  cscope.po.out >/dev/null 2>&1

cd / 	
find  $LNX                                                                \
	-path "$LNX/arch/*" ! \( -path "$LNX/arch/mips*" \) -prune -o               \
	-path "$LNX/include/asm-*" ! \( -path "$LNX/include/asm-mips*" -o -path "$LNX/include/asm-generic*" \) -prune -o \
	-path "$LNX/tmp*" -prune -o                                           \
	-path "$LNX/Documentation*" -prune -o                                 \
	-path "$LNX/scripts*" -prune -o                                       \
	-path "$LNX/drivers*" -prune -o                                       \
        -name "*.[chxsS]" -print >$LNX/gtags.files

find $LNX/drivers -path "$LNX/*svn*" -prune -o \
	-path "$LNX/drivers/mmc*" -prune -o -type f -iname '*jz*.[chxsS]' -print >>$LNX/gtags.files
find $LNX/drivers -wholename "$LNX/drivers/base*.[ch]" -print >>$LNX/gtags.files
find $LNX/drivers -wholename "$LNX/drivers/mmc*.[ch]" -print >>$LNX/gtags.files
find $LNX/drivers -wholename "$LNX/drivers/i2c*.[ch]" -print >>$LNX/gtags.files
find $LNX/drivers -wholename "$LNX/drivers/video*.[ch]" -print >>$LNX/gtags.files
find $LNX/drivers -wholename "$LNX/drivers/media/video*.[ch]" -print >>$LNX/gtags.files
find $LNX/drivers -wholename "$LNX/drivers/misc/jz_cim*.[ch]" -print >>$LNX/gtags.files
find $LNX/drivers -wholename "$LNX/drivers/usb*.[ch]" -print >>$LNX/gtags.files
find $LNX/drivers -wholename "$LNX/drivers/net*.[ch]" -print >>$LNX/gtags.files
find $LNX/drivers -wholename "$LNX/drivers/power*.[ch]" -print >>$LNX/gtags.files
find $LNX/drivers -wholename "$LNX/drivers/input*.[ch]" -print >>$LNX/gtags.files
find $LNX/drivers -wholename "$LNX/drivers/gpu*.[ch]" -print >>$LNX/gtags.files
find $LNX/drivers -wholename "$LNX/drivers/staging/android*.[ch]" -print >>$LNX/gtags.files
find $LNX/drivers -wholename "$LNX/drivers/char*.[ch]" -print >>$LNX/gtags.files
find $LNX/drivers -wholename "$LNX/drivers/mfd*.[ch]" -print >>$LNX/gtags.files
find $LNX/drivers -wholename "$LNX/drivers/regulator*.[ch]" -print >>$LNX/gtags.files
find $LNX/drivers -wholename "$LNX/drivers/dma*.[ch]" -print >>$LNX/gtags.files
find $LNX/drivers -wholename "$LNX/drivers/gpio*.[ch]" -print >>$LNX/gtags.files
find $LNX/drivers -wholename "$LNX/drivers/cpufreq*.[ch]" -print >>$LNX/gtags.files

cd $LNX
gtags -f $LNX/gtags.files

cp $LNX/gtags.files $LNX/cscope.files
cscope -b -q -k
