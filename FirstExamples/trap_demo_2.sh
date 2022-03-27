#!/usr/bin/env bash
# trap_demo_2.sh: Simple signal handling demo.
# In this example, a separate shell function is specified for each signal to be
# handled.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


# Global definitions.
readonly delay=5


exit_on_signal_SIGINT() {
    echo 'Script interrupted.' 2>&1
    exit 0
}


exit_on_signal_SIGTERM() {
    echo 'Script interrupted.' 2>&1
    exit 0
}


main() {
    trap exit_on_signal_SIGINT SIGINT
    trap exit_on_signal_SIGTERM SIGTERM

    for i in {1..5}; do
        echo "Iteration $i of 5."
        sleep "$delay"
    done
}


main
