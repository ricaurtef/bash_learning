#!/usr/bin/env bash
# Shell function demo.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


funct() {
    echo 'Step 2'
    return
}


# Main program starts here.
main() {
    echo 'Step 1'
    funct
    echo 'Step 3'
}


main
