ActiveState Linux Autobuild Assignment
======================================
INSTRUCTIONS
------------
buildpy.sh
----------
1. Change permissions of buildpy.sh prior to use 
   * ([user@host]$chmod u+x buildpy.sh)

2. build c-blosc 1.14.2 from source (USED BY python-blosc 1.5.1 build) 
   * Find source URL "CBLOSC_URL=https://github.com/Blosc/c-blosc/archive/v1.14.2.tar.gz"
   * Create a working directory ([user@host]$ mkdir TopLevelbuild; cd TopLevelbuild)
   * Download source file using wget ([user@host]$ wget $CBLOSC_URL)
   * Verify sha256sum checksums sha256sum -c $CBLOSC.sha256
   * (Optional if no Signatures available) Verify GPG sig (using gpgv2 (Setup alias [User@host]$ alias gpgv=gpgv2)
   * untar archive [user@host]$ tar -xvf $CBLOSCARCHIVE
   * Clean up directory rm *tar.gz; rm *.sha256
   * Create a buildlog directory [user@host]$ mkdir buildlogs
   * Use cmake
   * make -j (Number of procs) e.g. $(nproc)
   * make DESTDIR=~/ install
   * Set an environment variable to locate c-blosc shared objects using LD_LIBRARY_PATH
   * No binaries install just shared objects so PATH does not need to be adjusted

3. build OpenSSL 1.0.2o from source (USED BY Python 3.5.4 build)
   * Find source URL "OPENSSL1-0-2o_URL=https://www.openssl.org/source/old/1.0.2/openssl-1.0.2o.tar.gz"
   * Download source file using wget ([user@host]$ wget $OPENSSL1-0-2o_URL
   * Verify sha256sum checksum1
   * Verify sha1sum checksum
   * (Optional if no Signatures available) Verify GPG sig ([User@host]$gpgv $OPENSSL1-0-2o.tar.gz.asc $OPENSSL1-0-2o.tar.gz)
   * untar archive [user@host]$ tar -xvf $OPENSSL1-0-2oARCHIVE
   * Clean up directory
   * config for host
   * make 
   * (for openssl < 1.1.x) make INSTALL_PREFIX=~/ -j $(nproc)
   * (for openssl > 1.1.x) make DESTDIR=~/ -j $(nproc)
   * Set an environment variable to locate openssl binaries and shared objects
   * locate shared objects using "export LD_LIBRARY_PATH=~/path/to/ssl/lib:$LD_LIBRARY_PATH"
   * locate openssl binaries using "export PATH~/ssl/bin:$PATH"

4. build python-blosc 1.5.1 python package from source 
   * Find source URL "PYTHONBLOSC1-5-1_URL=https://files.pythonhosted.org/packages/bc/c1/a61ee9b605ceee140a638f70734be44c489ad919ba6fb698d18239baa8b2/blosc-1.5.1.tar.gz"
   * Download source file using wget ([user@host]$ wget $PYTHONBLOSC1-5-1_URL
   * Verify sha256sum checksum1
   * (Optional if no Signatures available) Verify GPG sig ([User@host]$gpgv $OPENSSL1-0-2o.tar.gz.asc $OPENSSL1-0-2o.tar.gz)
   * untar archive [user@host]$ tar -xvf $PYTHONBLOSC1-5-1ARCHIVE
   * Clean up directory
   * cd into blosc-1.5.1
   * Set an environment variable to locate openssl binaries and shared objects
   * locate shared objects using "export LD_LIBRARY_PATH=~/path/to/ssl/lib:$LD_LIBRARY_PATH"
   * locate openssl binaries using "export PATH=~/usr/local/ssl/bin:$PATH"
   * export SSL=~/usr/local/ssl
5. build Python 3.5.4 from source
   * download src [user@host]$ wget https://www.python.org/ftp/python/3.5.4/Python-3.5.4.tar.xz
   * download gpg key [user@host]$wget https://www.python.org/ftp/python/3.5.4/Python-3.5.4.tar.xz.asc
   * sha256 checksum verification
   * gpg verification of source [user@host]$ gpgv Python-3.5.4.tar.xz.asc Python-3.5.4.tar.xz
   * untar archive [user@host]$ tar -xvf Python-3.5.4.tar.xz
   * clean up dir [user@host]$rm Python-3.5.4.tar.xz;rm Python-3.5.4.tar.xz.sha256; rm Python-3.5.4.tar.xz.asc
   * cd Python-3.5.4; mkdir build; cd build;
   * Configure for host system [user@host]$ ../configure | tee buildlog.txt
   * Time build and output to log [user@host]$ time KBUILD_TIMESTAMP='' make -j $(nproc) | tee buildlog.txt
   * Install to "~/usr/local [user@host]$make DESTDIR=~/ install -j $(nproc)"

autobuildsrc.sh
---------------
1. extend interface to automate other builds
   * Extension script using the following setup
   * ./autobuild.sh CCompiler CXXCompiler URL LIBRARY CMakeBuild[1=yes/0=no]
   * USAGE
   * first arg $1="C Compiler" e.g. nvcc
   * second arg $2="CXX Compiler" e.g. g++
   * third arg $3=$SRC_URL e.g. https://github.com/Kitware/CMake/releases/download/v3.15.0-rc4/cmake-3.15.0-rc4.tar.gz
   * fourth arg $4=$LIBRARY e.g. cmake-3.15.0-rc4.tar.gz
   * fifth arg $5=[1/0] e.g. does the source archive use cmake or configure?

