#/bin/bash

MAKE_CONFIG="make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- penguin_defconfig -j16"
MAKE_LINUX="make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j16"
MAKE_DTBS="make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- dtbs -j16"
MAKE_MODULES="make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- INSTALL_MOD_PATH=../setup/build/output/ modules_install"
CLEAN_LINUX="make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- distclean -j16"

if [ $1 = "-h" ]
then
	echo "-m make linux"
	echo "-c clean linux"
	
elif [ $1 = "-c" ]
then
	$CLEAN_LINUX

elif [ $1 = "-m" ]
then
	if [ $2 = "linux" ]
	then
		$MAKE_CONFIG && $MAKE_LINUX && $MAKE_MODULES
	elif [ $2 = "dtbs" ]
	then
		$MAKE_CONFIG && $MAKE_DTBS
	fi
else
	echo "Please enter -h for help!"

fi