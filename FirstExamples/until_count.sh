#!/usr/bin/env bash
# until_count.sh: display a series of numbers.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    local count=1 delay=1

    until (( count > 5 )); do
        echo "$count"
        (( ++count ))
        sleep $delay
    done
    echo 'Finished.'
}


main
