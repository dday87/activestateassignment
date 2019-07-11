ActiveState Linux Autobuild Assignment
======================================
INSTRUCTIONS
------------
1. Change permissions of buildpy.sh prior to use ([user@host]$chmod u+x buildpy.sh)
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
   * Set an environment variable to locate c-blosc shared objects
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
   * Set an environment variable to locate openssl binaries and shared objects
4. build python-blosc 1.5.1 python package from source 
5. build Python 3.5.4 from source
6. extend interface to automate other builds



