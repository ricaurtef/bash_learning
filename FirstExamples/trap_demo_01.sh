#!/usr/bin/env bash
# trap_demo_01.sh: simple signal handling demo.

# __author__ = 'Ruben Ricaurte <ricaurtef@gmail.com>'

# set -o errexit


main() {
    # Staring point of program execution.
    trap "echo 'I am ignoring you.'" SIGINT SIGTERM

    for i in {1..5}; do
        echo "Iteration $i of 5."
        sleep 5
    done
}


main
