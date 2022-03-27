#!/usr/bin/env bash
# read_multiple.sh: read multiple values from keyboard.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    read -rp 'Enter one or more values > ' var{1..5}

	cat <<- EOF
var1 = '$var1'
var2 = '$var2'
var3 = '$var3'
var4 = '$var4'
var5 = '$var5'
	EOF
}


main
