#!/usr/bin/env bash
# process_substitution.sh: demo of process substitution.

# __author__ = 'Ruben Ricaurte <ricaurtef@gmail.com>'

set -o errexit


main() {
    # Staring point of program execution.
    # shellcheck disable=SC2012
    while read -r attr links owner group size month day time filename; do
		cat <<- EOF
Filename:   $filename
Size:       $size
Owner:      $owner
Group:      $group
Modified:   $month $day $time
Links:      $links
Attributes: $attr

		EOF
    done < <(ls -l | tail -n +2)
}


main

