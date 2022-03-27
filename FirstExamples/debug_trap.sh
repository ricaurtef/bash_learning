#!/usr/bin/env bash
# debug_trap.sh: Debugging scripts using trap.

# Author: Ruben Ricaurte <ricaurtef@gmail.com>


trace() {
    printf '%s: five_val=%s, two_val=%s, total=%s\n' "$LINENO" "$five_val" \
    "$two_val" "$total"
}


main() {
    local five_val=5 two_val=2

    trap trace DEBUG
    total=$(( five_val + two_val ))
    echo "Total is: $total"
    total=0 && echo 'Resetting Total.'
}


main "$@"
