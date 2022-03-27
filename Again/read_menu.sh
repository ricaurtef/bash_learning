#!/usr/bin/env bash
# read_menu.sh: a menu driven system information program.

# __author__ =  Ruben Ricaurte <ricaurtef@gmail.com>


display_menu() {
    clear

	cat <<- EOF
Please Select:

1. Display System Information
2. Display Disk Space
3. Display Home Space Utilization
0. Quit
	EOF

   read -rp 'Enter selection [0-3] > '
}


main() {
    local delay=5  # Number of seconds to display results.

    while true; do
        display_menu

        case "$REPLY" in
            1)
                echo "Hostname: $HOSTNAME"
                uptime
                sleep "$delay"
                ;;
            2)
                df -h
                sleep "$delay"
                ;;
            3)
                (( EUID == 0 )) && dir="$(dirname "$HOME")/*" || dir="$HOME"
                echo "Home Space Utilization"
                eval du -sh "$dir" 2> /dev/null
                sleep "$delay"
                ;;
            0)
                echo 'Program terminated.'
                break
                ;;
            *)
                echo 'Invalid entry.' >&2
                sleep "$delay"
                ;;
        esac
    done
}


main
