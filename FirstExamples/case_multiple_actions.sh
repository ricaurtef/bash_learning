#!/usr/bin/env bash
# case_multiple_actions.sh: modern versions of bash add the ";;&" notation to
# terminate each action to allow _case_ to continue to the next test rather
# than simply terminating.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    read -n 1 -rp 'Type a character > '
    echo
    case "$REPLY" in
        [[:upper:]])
            echo "'$REPLY' is upper case."
            ;;&
        [[:lower:]])
            echo "'$REPLY' is lower case."
            ;;&
        [[:alpha:]])
            echo "'$REPLY' is alphabetic."
            ;;&
        [[:digit:]])
            echo "'$REPLY' is a digit."
            ;;&
        [[:graph:]])
            echo "'$REPLY' is a visible character."
            ;;&
        [[:punct:]])
            echo "'$REPLY' is a punctuation symbol."
            ;;&
        [[:space:]])
            echo "'$REPLY' is a whitespace character."
            ;;&
        [[:xdigit:]])
            echo "'$REPLY' is a hexadecimal digit."
            ;;&
    esac
}


main
