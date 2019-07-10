ActiveState Linux Autobuild Assignment
======================================
INSTRUCTIONS
------------
0. Change permissions of buildpy.sh prior to use ([user@host]$chmod u+x buildpy.sh)
1. build c-blosc 1.14.2 from source (USED BY python-blosc 1.5.1 build) 
 1. Find source URL "https://github.com/Blosc/c-blosc/archive/v1.14.2.tar.gz"
 2. Create a working directory ([user@host]$ mkdir autobuildpy; cd autobuildpy)
 3. Download source file using wget ([user@host]$ wget $CBLOSC_URL
 4. Verify sha256sum checksums
 5. (Optional if no Signatures available) Verify GPG sig (using gpgv2 (Setup alias [User@host]$ alias gpgv=gpgv2)
 6. untar archive [user@host]$ tar -xvf $CBLOSCARCHIVE
 7. Clean up directory
 8. 
2. build OpenSSL 1.0.2o from source (USED BY Python 3.5.4 build)
3. build python-blosc 1.5.1 python package from source 
4. build Python 3.5.4 from source
5. extend interface to automate other builds



