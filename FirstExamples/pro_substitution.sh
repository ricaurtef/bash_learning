#!/usr/bin/env bash
# pro_substitution.sh: Demo of process substitution.
# shellcheck disable=SC2012

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>

main() {
    while read -r attr links owner group size month day time filename; do
		cat <<- EOF
Filename:   $filename
Size:       $size
Owner:      $owner
Group:      $group
Modified:   $month/$day $time
Links:      $links
Attributes: $attr

		EOF
    done < <(ls -l | tail -n +2)
}


main
