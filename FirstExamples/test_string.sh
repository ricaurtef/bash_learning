#!/usr/bin/env bash
# test_string.sh: evaluate the value of a string.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    local ANSWER=foo

    if [[ -z "$ANSWER" ]]; then
        echo 'There is no answer.' >&2
        return 1
    fi

    case "$ANSWER" in
        'yes')
            echo 'The answer is YES.';;
        'no')
            echo 'The answer is NO.';;
        'maybe')
            echo 'The answer is MAYBe.';;
        *)
            echo 'The answer is UNKNOWN.';;
    esac
}


main
