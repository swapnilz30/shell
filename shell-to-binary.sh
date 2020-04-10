#!/bin/bash

file_dir_path=`echo "$(dirname -- $script_name)"`
dir_path=`echo "$(dirname -- $file_dir_path)"`
echo "$dir_path"
echo "$file_dir_path"
echo "$script_name"
shc_version="3.8.9"
shc_tar="shc-$shc_version.tgz"

src_path="/usr/src"
shc_man="/usr/local/man/man1/"

exit_script(){

    # Exit the script.
    exit $1
}

check_require_pkgs(){

    # Check the required make and wget packages are installed or not.
    require_pkgs="make wget"

    for pkg in $require_pkgs
    do
        rpm -q $pkg
        if [ $? -ne 0 ];then
            echo "The $pkg not installed."
            exit_script 1
        fi        
   done  
}

check_file_path(){

    # Check the user entered file exist or not.
    script_name="$1"
    if [ ! -f "$script_name" ];then
        echo "File not found."
        exit 1
    fi  
}

download_shc_tgz(){

    # Downalod the tgz file.
    if [ ! -f $src_path/$shc_tar ];then
        wget -P $src_path http://www.datsi.fi.upm.es/~frosal/sources/shc-$shc_version.tgz
        if [ $? -ne 0 ];then
            echo "Failed to download http://www.datsi.fi.upm.es/~frosal/sources/shc-$shc_version.tgz"
  	        exit 1
      fi
  fi
}

install_shc(){

    # Untar and install the shc
    sudo tar -C $src_path -xzf $src_path/shc-$shc_version.tgz
    if [ $? -ne 0 ];then
        echo "Failed to untar the shc-$shc_version.tgz file."
        exit 1
    fi

    make -C $src_path/shc-$shc_version
    make install -C $src_path/shc-$shc_version

    if [ $? -ne 0 ];then
        echo "Failed to installed."
        exit 1
    fi

    # Convert shell script file to binary.
    $src_path/shc-$shc_version/shc -r -f $script_name

    if [ $? -eq 0 ];then
       echo "Successully screated the file."
    else
       echo "Failed to create the file."
    fi
}


####Main####

script_name="$1"

if [ -z $script_name ];then
    echo -e "Enter the filename to convert binary file. Check the following command to run the script.\n\"sudo $0 <file_name>\""
    exit_script 1 
fi


if [ ! -d $shc_man ];then
    mkdir -p $shc_man
fi

check_require_pkgs

check_file_path "$script_name"

download_shc_tgz

install_shc
