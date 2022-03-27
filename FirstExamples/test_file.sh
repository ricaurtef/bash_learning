#!/usr/bin/env bash
# test_file.sh: Evaluate the status of a file.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    local FILE=~/.bash_profile

    if [[ -e "$FILE" ]]; then
        if [[ -f "$FILE" ]]; then
            echo "$FILE is a regular file."
        fi
        if [[ -d "$FILE" ]]; then
            echo "$FILE is a directory."
        fi
        if [[ -r "$FILE" ]]; then
            echo "$FILE is readable."
        fi
        if [[ -w "$FILE" ]]; then
            echo "$FILE is writable."
        fi
        if [[ -x "$FILE" ]]; then
            echo "$FILE is executable/searchable."
        fi
    else
        echo "$FILE does not exist."
        return 1
    fi
}


main
