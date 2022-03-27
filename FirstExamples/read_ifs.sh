#!/usr/bin/env bash
# read_ifs.sh: Read fields from a file.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


# Global definitions.
readonly filename=/etc/passwd


main() {
    read -rp 'Enter a username: ' username

    file_info=$(grep "^$username:" "$filename")

    if [[ -n "$file_info" ]]; then
        IFS=':' read -r user _ uid gid name home shell <<< "$file_info"
		cat <<- EOF
    User: '$user'
    UID: '$uid'
    GID: '$gid'
    Full name: '$name'
    Home dir: '$home'
    Shell: '$shell'
		EOF
    else
        echo "No such user '$username'" >&2
        return 1
    fi
}


main
