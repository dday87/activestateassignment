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
BLOSC_DIR=$(pwd)
export BLOSC_DIR
export LD_LIBRARY_PATH=~/usr/local/lib:$LD_LIBRARY_PATH
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
cd ../../../
#If OPENSSLv < 1.1.x
make INSTALL_PREFIX=~/ install
#If OPENSSLv > 1.1.x
# make install DESTDIR=~/ 
export PATH=~/usr/local/ssl/bin:$PATH
export LD_LIBRARY_PATH=~/usr/local/ssl/lib:$LD_LIBRARY_PATH
export SSL=~/usr/local/ssl
#3 build python-blosc 1.5.1 python package from source 
wget https://files.pythonhosted.org/packages/bc/c1/a61ee9b605ceee140a638f70734be44c489ad919ba6fb698d18239baa8b2/blosc-1.5.1.tar.gz
sha256sum blosc-1.5.1.tar.gz > blosc-1.5.1.tar.gz.sha256
sha256sum -c blosc-1.5.1.tar.gz
tar -xvf blosc-1.5.1.tar.gz
rm blosc-1.5.1.tar.gz.sha256
rm blosc-1.5.1.tar.gz
cd blosc-1.5.1
python setup.py build_clib
python setup.py build_ext --inplace
PYTHONPATH=.
export PYTHONPATH=.
python blosc/test.py
PYTHONPATH=. python bench/compress_ptr.py
export LD_LIBRARY_PATH=$PWD/blosc:$LD_LIBRARY_PATH
cd ..
#4 build Python 3.5.4 from source
wget https://www.python.org/ftp/python/3.5.4/Python-3.5.4.tar.xz
wget https://www.python.org/ftp/python/3.5.4/Python-3.5.4.tar.xz.asc
sha256sum Python-3.5.4.tar.xz > Python-3.5.4.tar.xz.sha256
sha256sum -c Python-3.5.4.tar.xz
gpgv Python-3.5.4.tar.xz.asc Python-3.5.4.tar.xz
tar -xvf Python-3.5.4.tar.xz
rm Python-3.5.4.tar.xz
rm Python-3.5.4.tar.xz.sha256
rm Python-3.5.4.tar.xz.asc
cd Python-3.5.4
mkdir build
cd build
../configure | tee buildlog.txt
time KBUILD_TIMESTAMP='' make -j $(nproc) | tee buildlog.txt
make DESTDIR=~/ install -j $(nproc)


