#!/usr/bin/env bash
# hours.sh: script to count files by modification time.

# __author__ = 'Ruben Ricaurte <ricaurtef@gmail.com>'

usage() {
    echo "Usage: $(basename "${0%.*}") <directory>"

    return
}


display_data() {
    echo -e 'Hour\tFiles\tHour\tFiles'
    echo -e '----\t-----\t----\t-----'
    for i in {0..11}; do
        j=$(( i + 12 ))
        printf '%02d\t%4d\t%02d\t%4d\n' "$i" "${hours[i]}" "$j" "${hours[j]}"
    done

    printf '\nTotal files = %d\n' "$count"
}


main() {
    local dir=$1
    mapfile -t hours < <(for _ in {0..23}; do echo 0; done)  # Initialization.

    # Check that the argument that was provided is a directory.
    [[ ! -d "$dir" || $# -gt 1 ]] && { usage >&2; return 1; }

    # Collect data.
    for i in $(stat -f '%Sm' "$dir"/* | cut -c 8-9); do
        j="${i#0}"
        (( ++hours[j] ))
        (( ++count ))
    done

    display_data
}


main "$@"
