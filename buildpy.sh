!#/bin/bash
echo "Please be sure to chmod u+x buildpy.sh prior to use!"
mkdir TopLevelbuild
TLB="TopLevelBuild"
export TLDB
cd TLDB
wget "https://github.com/Blosc/c-blosc/archive/v1.14.2.tar.gz"
sha256sum v1.14.2.tar.gz > v1.14.2.tar.gz.sha256
sha256sum -c v1.14.2.tar.gz.sha256
alias gpgv=gpgv2
tar -xvf v1.14.2.tar.gz
rm v1.14.2.tar.gz.sha256
rm v1.14.2.tar.gz
cd c-blosc-1.14.2
mkdir build 
cd build
mkdir ../buildlogs
cmake .. | tee ../buildlogs/cmakeconf.log.txt
make -j $(nproc) | tee ../buildlogs/build.log.txt
cd blosc
CBLOSCDIR=$(pwd)
export CBLOSCDIR
echo $CBLOSCDIR
#INSTRUCTIONS
#1 build c-blosc 1.14.2 from source (USED BY python-blosc 1.5.1 build) 
#2 build OpenSSL 1.0.2o from source (USED BY Python 3.5.4 build)
#3 build python-blosc 1.5.1 python package from source 
#4 build Python 3.5.4 from source
#5 extend interface to automate other builds


