# Author: Ruben Ricaurte <ricaurtef@gmail.com>


BEGIN {
    FS = ":"
    format = "%-10s \t %-10s\n"

    print "The latest list of users and shells"
    printf format, "UserID", "Shell"
    printf format, "------", "-----"
}

{
    printf format, $1, $7
}

END {
    print "This concludes the listing."
}
