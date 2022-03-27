#!/usr/bin/env bash
# async_child.sh: Asynchronous execution demo (child).

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    echo 'Child: child is running...'
    sleep 10
    echo 'Child: child is done. Exiting.'
}


main
