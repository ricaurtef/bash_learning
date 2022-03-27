#!/usr/bin/env bash
# embeded_awk.sh: showing how to embed a awk script.

# Author: Ruben Ricaurte <ricaurtef@gmail.com>


list_user_shell() {
    local file_=$1
    local program
    read -rd '' program <<- EOF
        BEGIN {
            FS = ":"
            format = "%-10s \t %-10s\n"

            print "The latest list of users and shells"
            printf format, "UserID", "Shell"
            printf format, "------", "-----"
        }

        {
            printf format, \$1, \$7
        }

        END {
            print "This concludes the listing."
        }
	EOF

    # grep '^[^#_]' "$file_" | awk "$program"
    # awk "$program" < <(grep '^[^#_]' "$file_")
    grep '^[^#_]' "$file_" > >(awk "$program")
}


main() {
    # Staring point of program execution.
    local -r filename='/etc/passwd'

    list_user_shell "$filename"
}


main
