#!/bin/bash
#
# http://grover.open2space.com/content/bash-script-menus-and-functions

showMenu () 
{
        echo "1) bob"
        echo "2) amy"
        echo "3) quit"
}

while [ 1 ]
do
        showMenu
        read CHOICE
        case "$CHOICE" in
                "1")
                        echo "Bob was here"
                        ;;
                "2")
                        echo "Amy was here"
                        ;;
                "3")
                        exit
                        ;;
        esac
done
