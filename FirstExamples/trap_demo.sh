#!/usr/bin/env bash
# trap_demo.sh: Simple signal handling demo.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


# Global definitions.
readonly delay=5

main() {
    trap "echo 'I am ignoring you.'" SIGINT SIGTERM

    for i in {1..5}; do
        echo "Iteration $i of 5."
        sleep "$delay"
    done
}


main
