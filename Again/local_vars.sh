#! /usr/bin/env bash
# local_vars.sh - Script to demonstrate local variables.

# Author: Ruben Ricaurte <ricaurtef@gmail.com>


# Global definitions.
foo=0


funct_1() {
    local foo  # Variable foo local to funct_1.

    foo=1
    echo "funct_1: foo = $foo"
}


funct_2() {
    local foo  # Variable foo local to funct_2.

    foo=2
    echo "funct_2: foo = $foo"
}


main() {
    echo "global:  foo = $foo"
    funct_1
    echo "global:  foo = $foo"
    funct_2
    echo "global:  foo = $foo"
}


main "$@"
