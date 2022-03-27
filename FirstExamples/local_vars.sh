#!/usr/bin/env bash
# Script to demonstrate local variables.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


# Global definitions.
foo=0  # Global variable foo.


funct_1() {
    local foo  # Variable foo local to funct_1

    foo=1
    printf 'funct_1:\tfoo = %s\n' "$foo"
}


funct_2() {
    local foo  # Variable foo local to funct_1

    foo=2
    printf 'funct_2:\tfoo = %s\n' "$foo"
}


main() {
    printf 'global: \tfoo = %s\n' "$foo"
    funct_1
    printf 'global: \tfoo = %s\n' "$foo"
    funct_2
    printf 'global: \tfoo = %s\n' "$foo"
}


main
