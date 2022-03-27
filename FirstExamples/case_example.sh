#!/usr/bin/env bash
# case_example.sh: case pattern examples.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    read -rp 'Enter word > '

    case "$REPLY" in
        [[:alpha:]])
            echo 'is a single alphabetic character.'
            ;;
        [A-C][[:digit:]])
            echo 'is A, B, or C followed by a digit.'
            ;;
        ???)
            echo 'is three characters long.'
            ;;
        *.txt)
            echo 'is a word ending in ".txt"'
            ;;
        *)
            echo 'is something else.'
            ;;
    esac
}


main
