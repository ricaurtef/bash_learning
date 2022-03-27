#!/usr/bin/env bash
# while_count.sh: display a series of numbers.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    local count=1

    while (( count < 6 )); do
        echo $count
        (( ++count ))
    done
    echo 'Finished.'
}


main
