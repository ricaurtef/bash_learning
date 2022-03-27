#!/usr/bin/env bash
# read_validate.sh: validate input.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


invalid_input() {
    echo "Invalid input '$REPLY'" >&2
    exit 1
}


main() {
    read -rp 'Enter a single item > '

    # Input is empty (invalid)
    [[ -z "$REPLY" ]] && invalid_input

    # Input is multiple items (invalid)
    (( "$(echo "$REPLY" | wc -w)" > 1 )) && invalid_input

    # Is input a valid filename?
    if [[ "$REPLY" =~ ^[-._[:alnum:]]+$ ]]; then
        echo "'$REPLY' is a valid filename."
        if [[ -e "$REPLY" ]]; then
            echo "And file '$REPLY' exists."
        else
            echo "However, file '$REPLY' does not exist."
        fi

        # Is input a floating point number?
        if [[ "$REPLY" =~ ^-?[[:digit:]]+\.[[:digit:]]+$ ]]; then
            echo "'$REPLY' is a floating point number."
        else
            echo "'$REPLY' is not a floating point number."
        fi

        # Is input an integer?
        if [[ "$REPLY" =~ ^-?[[:digit:]]+$ ]]; then
            echo "'$REPLY' is an integer."
        else
            echo "'$REPLY' is not an integer."
        fi
    else
        echo "The string '$REPLY' is not a valid filename."
    fi
}


main
