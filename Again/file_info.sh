#!/usr/bin/env bash
# file_info.sh: simple file information program.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


# Global definitions.
PROGNAME="$(basename "${0%.*}")"


usage() {
    echo -e "Usage:\n  $PROGNAME <filename>"
    exit 1
}


main() {
    [[ ! -e "$1" || -z "$1" ]] && usage >&2

    echo "File Type:"
    file "$1"
    echo -e "\nFile Status:"
    stat "$1"
}


main "$@"
