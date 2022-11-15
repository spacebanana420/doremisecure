#!/bin/bash

#------Config------
encryption=zip #zip, gpg, openssl (gpg to be added)
format_zip=doremyzip
format_openssl=doremy
zip_level=0 #0-9, 0 recommended to disable compression
cipher=aes256 # "openssl enc -ciphers" for a full list of available ciphers
folder="Secured Folder" # If the folder name is "current", the script will analyze the current directory instead
#------------------

function encrypt ()  {
case $encryption in
zip)
    if [[ $1 != ".$format_zip" ]]
    then
        zip -$3 -v -r -P "$2" "$1.$format_zip" "$1"
    fi
;;
gpg)
;;
openssl)
    if [[ $1 != ".$format_openssl" ]]
    then
        openssl enc -e -in "$1" -k "$2" -pbkdf2 -$cipher -out "$1.$format_openssl"
    fi
;;
esac
}

function decrypt () {
case $encryption in
zip)
    if [[ $1 == ".$format_zip" ]]
    then
        unzip -P "$2" $1
    fi
;;
gpg)
;;
openssl)
    if [[ $1 == ".$format_openssl" ]]
    then
        noformat=$(basename "$1" ".$format_openssl")
        openssl enc -d -in "$1" -k "$2" -pbkdf2 -$cipher -out "$noformat"
    fi
;;
esac
}

echo "Input password"
read password

case $1 in
d)
    if [[ $folder != "current" ]]
    then
        cd "$folder"
    fi
    for i in *
    do
        decrypt $i $password
    done
;;
e)
    if [[ $folder != "current" ]]
    then
        cd "$folder"
    fi
    for i in *
    do
        if [[ $1 != "doremisecure.sh" ]]
        then
            encrypt $i $password $zip_level
        fi
    done
;;
*)
        echo "Secure Folder Version 0.4"
        echo "Usage: securefolder.sh [option]"
        echo "Options:"
        echo "h      Help documentation"; echo "e      Encrypt a file/folder"; echo "d      Decrypt a file/folder"
;;
esac
