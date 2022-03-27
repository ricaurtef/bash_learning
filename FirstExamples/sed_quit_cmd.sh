#!/usr/bin/env bash
# sed_quit_cmd.sh: Sed Quit command example.
# Prints out the first ten lines of a file provided by command line.
# This suppose to performe betther than: sed -n '1,10p' name_of_file.

# Author: Ruben Ricaurte <ricaurtef@gmail.com>

set -o errexit


main() {
    for file_; do
        # sed 10q "$file_"
        sed -n '1,10p' "$file_"
    done
}


main "$@"
