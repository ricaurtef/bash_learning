#!/usr/bin/env bash
# read_menu.sh: A menu driven system information program.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


display_menu() {
    clear

	cat <<- EOF
1. Display System Information
2. Display Disk Space
3. Display Home Space Utilization
0. Quit
	EOF

    read -rp 'Enter selection [0-3] > '
    return
}


main() {
    display_menu

    case $REPLY in
        0)  echo 'Program terminated.' 
            ;;
        1)  echo "Hostname: $HOSTNAME"
            uptime
            ;;
        2)  df -h
            ;;
        3)  (( EUID == 0 )) && dir=(/Users/*) || dir=("$HOME")
            echo 'Home Space Utilization'
            eval "du -sh ${dir[*]} 2> /dev/null"
            ;;
        *)  echo 'Invalid entry.' >&2
            return 1
            ;;
    esac
}


main
