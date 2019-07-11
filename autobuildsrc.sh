#!/bin/bash

CC=$1
CXX=$2
URL=$3
LIBRARY=$4
CMAKE_BUILD=$5

wget "$URL"
sha256sum "$LIBRARY" > "$LIBRARY".sha256
sha256sum -c "$LIBRARY".sha256
tar -xvf "$LIBRARY".tar.gz
cd $LIBRARY
mkdir build
cd build
if [ "$CMAKE_BUILD" EQ "1"  ]
then
	cmake .. | tee cmakelog.txt
	time KBUILD_TIMESTAMP='' CC=$CC CXX=$CXX make -j $(nproc) | tee buildlog.txt
	make DESTDIR=~/ install -j $(nproc)
else
	../configure
	time KBUILD_TIMESTAMP='' CC=$CC CXX=$CXX make -j $(nproc) | tee buildlog.txt
	make DESTDIR=~/ install -j $(nproc) 
fi
echo "[DONE BUILDING $LIBRARY]"
echo "[run updatedb and ldconfig -i as root user to update system]"
