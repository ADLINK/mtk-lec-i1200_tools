#!/bin/bash

# this is a trap for ctrl + c
trap ctrl_c INT


function ctrl_c()
{
	sed -i "s@$(pwd)@my_path@" format.xml
        exit
}

usage()
{
    cat << EOF
Usage: `basename $0` [OPTIONS]

Format empty ufs
You must connect otg to our board. 
e.g.
	./format_ufs.sh
EOF
}
while getopts "h:" o; do
    case "${o}" in
    *)
        usage
	return
        ;;
    esac
done


echo "===[Start format UFS]==="
cd SP_Flash_Tool_V5
sed -i "s@my_path@$(pwd)@" format.xml
./flash_tool -i format.xml
sed -i "s@$(pwd)@my_path@" format.xml
cd ..
