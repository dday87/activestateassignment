!#/bin/bash
#INSTRUCTIONS
#1 build c-blosc 1.14.2 from source (USED BY python-blosc 1.5.1 build) 
echo "Please be sure to chmod u+x buildpy.sh prior to use!"
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
make install DESTDIR=~/ -j $(nproc)
cd blosc
CBLOSCLIBDIR=$(pwd)
export CBLOSCLIBDIR
echo $CBLOSCLIBDIR
#2 build OpenSSL 1.0.2o from source (USED BY Python 3.5.4 build)
cd ../../../
wget https://www.openssl.org/source/old/1.0.2/openssl-1.0.2o.tar.gz
wget https://www.openssl.org/source/old/1.0.2/openssl-1.0.2o.tar.gz.sha256
wget https://www.openssl.org/source/old/1.0.2/openssl-1.0.2o.tar.gz.sha1
wget https://www.openssl.org/source/old/1.0.2/openssl-1.0.2o.tar.gz.asc
#sha256sum openssl-1.0.2o.tar.gz > openssl-1.0.2o.tar.gz.sha256
sha256sum -c openssl-1.0.2o.tar.gz.sha256
#sha1sum openssl-1.0.2o.tar.gz > openssl-1.0.2o.tar.gz.sha1
sha1sum -c openssl-1.0.2o.tar.gz.sha1
gpgv openssl-1.0.2o.tar.gz.asc openssl-1.0.2o.tar.gz
tar -xvf openssl-1.0.2o.tar.gz
rm openssl-1.0.2o.tar.gz
rm openssl-1.0.2o.tar.gz.sha256
rm openssl-1.0.2o.tar.gz.sha1
rm openssl-1.0.2o.tar.gz.asc
cd openssl-1.0.2o
mkdir buildlogs
./config | tee buildlogs/config.log.txt
make -j $(nproc) | tee buildlogs/opensslbuild.log.txt
cd include/openssl
OPENSSL_INCLUDES=$(pwd)
export OPENSSL_INCLUDES
cd ../..
#If OPENSSLv < 1.1.x
make INSTALL_PREFIX=~/ install
#If OPENSSLv > 1.1.x
# make install DESTDIR=~/ 
export PATH=~/usr/local/ssl/bin:$PATH
export LD_LIBRARY_PATH=~/usr/local/ssl/lib:$LD_LIBRARY_PATH
#3 build python-blosc 1.5.1 python package from source 
#4 build Python 3.5.4 from source
#5 extend interface to automate other builds


