#!/usr/bin/env bash
# longest_word.sh: find longest string in a file.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    for filename; do
        if [[ -r "$filename" ]]; then
            max_len=0
            for i in $(strings "$filename"); do
                len="${#i}"
                if (( len > max_len )); then
                    max_len="$len"
                    max_word="$i"
                fi
            done
            echo "$filename: '$max_word' ($max_len characters)."
        fi
    done
}


main "$@"
