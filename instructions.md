ActiveState Linux Autobuild Assignment
======================================
INSTRUCTIONS
------------
1. Change permissions of buildpy.sh prior to use ([user@host]$chmod u+x buildpy.sh)
2. build c-blosc 1.14.2 from source (USED BY python-blosc 1.5.1 build) 
   * Find source URL "https://github.com/Blosc/c-blosc/archive/v1.14.2.tar.gz"
   * Create a working directory ([user@host]$ mkdir autobuildpy; cd autobuildpy)
   * Download source file using wget ([user@host]$ wget $CBLOSC_URL
   * Verify sha256sum checksums
   * (Optional if no Signatures available) Verify GPG sig (using gpgv2 (Setup alias [User@host]$ alias gpgv=gpgv2)
   * untar archive [user@host]$ tar -xvf $CBLOSCARCHIVE
   * Clean up directory
   * 
3. build OpenSSL 1.0.2o from source (USED BY Python 3.5.4 build)
4. build python-blosc 1.5.1 python package from source 
5. build Python 3.5.4 from source
6. extend interface to automate other builds



