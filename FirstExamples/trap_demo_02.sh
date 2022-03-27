#!/usr/bin/env bash
# trap_demo_02.sh: simple signal handling demo.

# __author__ = 'Ruben Ricaurte <ricaurtef@gmail.com>'

# set -o errexit


exit_on_signal_SIGINT() {
    echo 'Script interrupted.' 2>&1
    exit 0
}


exit_on_signal_SIGTERM() {
    echo 'Script terminated.' 2>&1
    exit 0
}


main() {
    # Staring point of program execution.
    trap exit_on_signal_SIGINT SIGINT
    trap exit_on_signal_SIGTERM SIGTERM

    for i in {1..5}; do
        echo "Iteration $i of 5."
        sleep 5
    done
}


main
