#!/usr/bin/env bash
# async_parent.sh: Asynchronous execution demo (parent).

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    echo 'Parent: starting...'
    echo 'Parant: launching child script...'
    eval "$(pwd)/async_child.sh" &
    pid=$!
    echo "Parent: child (PID= $pid) launched."

    echo "Parent: continuing..."
    sleep 2

    echo 'Parent: pausing o wait for child to finish...'
    wait $pid

    echo 'Parent: child is finished. Continuing...'
    echo 'Parent: parent is done. Exiting.'
} 


main
