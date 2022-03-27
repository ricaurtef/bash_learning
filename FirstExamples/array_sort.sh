#!/usr/bin/env bash
# array_sort.sh: Sort an array.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    a=(Foxtrot Echo Delta Charlie Bravo Alpha)
    mapfile -t a_sorted < <(echo "${a[@]}" | xargs -n 1 | sort)

    printf 'Original array:\t%s\n' "${a[*]}"
    printf 'Sorted array:\t%s\n' "${a_sorted[*]}"
}


main
