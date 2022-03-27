#!/usr/bin/env bash
# array_sort.sh: sort an array.

# __author__ = 'Ruben Ricaurte <ricaurtef@gmail.com>'


main() {
    local -a array=(foxtrot echo delta charlie bravo alpha)
    mapfile -t sorted_array < <(echo "${array[*]}" | tr ' ' '\n' | sort)

    printf 'Original array: %s\n' "${array[*]}"
    printf 'Sorted array:   %s\n' "${sorted_array[*]}"
}


main
