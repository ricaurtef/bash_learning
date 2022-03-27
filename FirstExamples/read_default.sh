#!/usr/bin/env bash
# read_default.sh: supply a default value if user presses Enter key.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    read -rep 'What is your user name? ' -i "$USER"
    echo "You answered: '$REPLY'."
}


main
