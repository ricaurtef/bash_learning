#!/usr/bin/env bash
# file_info.sh: Simple file information program.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    local -r progname=$(basename "$0")
    filename="$1"
    
    if [[ -e "$filename" ]]; then
        echo -e "# File Type #"
        file "$filename"
        echo -e "\n# File Status #"
        stat "$filename"
    else
        echo "Usage: $progname <file>" >&2
        return 1
    fi
}


main "$@"
