#!/usr/bin/env bash
# array_owner_listing.sh: use arrays to tally file owners.

# __author__ = 'Ruben Ricaurte <ricaurtef@gmail.com>'

set -o errexit


usage() {
    echo "Usage: $(basename "${0%.*}") <dir>"

    return
}


display_files() {
    # List the collected files.
    for i in "${files[@]}"; do
        printf '%-40s %-10s %-10s\n' "$i" "${file_owner["$i"]}" \
                                     "${file_group["$i"]}"
    done | sort
}


display_owners() {
    # List owners
    echo "File owners:"
    for i in "${!owners[@]}"; do
        printf '%-10s -> %5d file(s)\n' "$i" "${owners["$i"]}"
    done | sort
}


display_groups() {
    # List groups.
    echo "File group owners:"
    for i in "${!groups[@]}"; do
        printf '%-10s -> %5d file(s)\n' "$i" "${groups["$i"]}"
    done | sort
}


main() {
    # Staring point of program execution.
    declare -A files file_group file_owner groups owners

    # Check that the argument that was provided is a directory.
    [[ $# -gt 1 || ! -d "$1" ]] && { usage >&2; return 1; }

    # Traverse the directory to collect data.
    for i in "$1"/*; do
        owner="$(stat -f '%Su' "$i")"
        group="$(stat -f '%Sg' "$i")"
        files["$i"]="$i"
        file_owner["$i"]="$owner"
        file_group["$i"]="$group"
        (( ++owners[$owner] ))
        (( ++groups[$group] ))
    done

    echo
    display_files

    echo
    display_owners

    echo
    display_groups
}


main "$@"
