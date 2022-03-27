#!/usr/bin/env bash
# upper_lower_declare.sh: demonstrate case conversion via declare.

# __author__ = 'Ruben Ricaurte <ricaurtef@gmail.com>'


main() {
    declare -u upper
    declare -l lower

    if (( $# )); then
        upper="$*" lower="$*"
        printf 'Upper: %s\nLower: %s\n' "$upper" "$lower"
    fi
}


main "$@"
