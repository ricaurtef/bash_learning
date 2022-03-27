#!/usr/bin/env bash
# debug_script.sh: Bash debug options example.

# Author: Ruben Ricaurte <ricaurtef@gmail.com>

# Debug output to a file.
exec {NEW_STDOUT}> "$(basename "${0%.*}").log"
PS4='$LINENO: '
BASH_XTRACEFD=$NEW_STDOUT


main() {
    read -rp 'Enter the input: ' val
    if (( val > 0 )); then
        echo 'Positive number entered.'
    else
        echo 'The input value is not positive.'
    fi
}


main "$@"
