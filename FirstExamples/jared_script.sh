#! /usr/bin/env bash

# Global definitions.
readonly filename=/proc/sys/fs/file-nr
readonly percentage=80


main() {
    read -r usage _ max < "$filename"

    if  (( usage > ((max*percentage) / 100) )); then
        echo "CRITICAL bla bla"
        exit 2
    else
        echo "OK - '$usage' of usage"
        exit 0
    fi
}

main "$@"
