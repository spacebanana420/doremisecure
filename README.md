# Description
DoremiSecure encrypts the files inside a fixed folder, with the intention of making it a "secure folder". The script can also be configured to encrypt the whole folder instead (only for zip archives)

# How to use
Download doremisecure.sh and execute it

The configuration is inside the script itself
DoremiSecure keeps the contents of a specific folder encrypted, making it fast and convenient to mass encrypt each file individually

# Configuration
### encryption
Choose the encryption utility. Currently it can either be openssl or zip

### format_zip:
The file format for encrypted zip files

### format_openssl:
The file format for encrypted files using OpenSSL

### zip_level:
The compression level of zip archives, ranging from 0 (none) to 9 (maximum)

### cipher:
The encryption mode for OpenSSL. Type the command "openssl enc -ciphers" for a full list of available ciphers

### folder:
The folder which will be used for encryption. If the folder name is "current", the script will analyze the current directory instead

# Requirements
Bash, zip/unzip, OpenSSL, GPG (to be added), coreutils or busybox
