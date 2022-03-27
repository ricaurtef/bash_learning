#!/usr/bin/env bash
# loan_calc.sh: script to calculate monthly loan payments.

# __author__ = 'Ruben Ricaurte <ricaurtef@gmail.com>'


# Global definitions.
progname="$(basename "${0%.*}")"
readonly progname
usage_msg="Usage: $progname [-h|--help] <principal> <interest> <months>"


usage() {
	cat <<- EOF
$usage_msg

Where:

Principal   is the amount of the loan.
Interest    is the APR as a number (7% = 0.07).
Months      is the length of the loan's term.

Optional arguments:
-h, --help  show this help message and exit.

Example:
    $progname 135000 0.0775 180

	EOF

    return
}


exception() {
    local msg="$usage_msg\n$progname: error: "

    case "$1" in
        option)
            msg+="unrecognized option: $2"
            ;;
        float)
            msg+="non-floating value: ${2# }"
            ;;
    esac
    echo -e "$msg"  # Output error message.

    exit 1
}


main() {
    case $# in
        1)
            case "$1" in
                -h|--help)
                    usage
                    ;;
                *)
                    exception "option" "$1" >&2
                    ;;
            esac
            ;;
        3)
            # Raise an exception if a non-floating value is provided.
            for argv; do
                [[ ! ($argv =~ ^[0-9]+\.?[0-9]+$) ]] && exception_arg+=" $argv"
            done

            if [[ -n "$exception_arg" ]]; then
                exception "float" "$exception_arg" >&2
            fi

            # Calculate monthly payment.
            principal=$1
            interest=$2
            months=$3

			bc <<- EOF
                scale = 10
                i = $interest / 12
                p = $principal
                n = $months
                a = p * ((i * ((i+1)^n)) / (((i+1)^n) - 1))
                print "Monthly payment: ", a, "\n"
			EOF
            ;;
        *)
            usage >&2
            return 1
            ;;
    esac
}


main "$@"
