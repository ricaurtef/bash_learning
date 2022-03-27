#!/usr/bin/env bash
# while_read.sh: read lines from a file.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


display_file() {
    local filename="$1"

    # First version: file redirection.
    # while read -r distro version release; do
		# cat <<- EOF
# Distro: 	$distro
# Version: 	$version
# Release: 	$release
		# EOF
    # done < "$filename"

    # Second version: using pipelines.
    printf '%8s\t %7s\t %8s\n' 'Distro' 'Version' 'Released'
    printf '%8s\t %7s\t %8s\n' '------' '-------' '--------'
    sort -k 1,1 -k 2n "$filename" | while read -r distro version release; do
        printf '%8s\t %7s\t %8s\n' "$distro" "$version" "$release"
    done
}


main() {
    display_file distros.txt
}


main
