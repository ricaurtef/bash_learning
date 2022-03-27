#!/usr/bin/env bash
# while_read_2.sh: Read lines from a file.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    sort -k 1,1 -k 2n distros.txt | while read -r distro version release; do
		cat <<- EOF
---
Distro:     $distro
Version:    $version
Released:   $release
		EOF
    done 
}


main
