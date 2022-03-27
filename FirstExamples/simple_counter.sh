#!/usr/bin/env bash
# simple_counter.sh: Demo of C style 'for' command.

# __author__ = Ruben Ricaurte <ricaurtef@gmal.com>


main() {
    for (( i = 0; i < 5; i++ )); do
        echo "$i"
    done
}


main
