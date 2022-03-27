# showargs.awk: Working with command-line arguments.
# Example: awk -f showargs.awk arg1=foo arg2=bar


BEGIN {
    print "ARGC =", ARGC
    for (k = 0; k < ARGC; ++k)
        printf "ARGV[%s] = [%s]\n", k, ARGV[k]
}
