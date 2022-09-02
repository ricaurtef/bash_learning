#!/usr/bin/env bash
# Script to retrieve a file via FTP. (Pay close attention to the HEREDOC)

# __author__ = Ruben Ricaute <ricaurtef@gmail.com>


# Global definitions.
readonly ftp_server=ftp.nl.debian.org
readonly code_name=bullseye
readonly arch=amd64
readonly remote_file=debian-cd_info.tar.gz
ftp_path="/debian/dists/$code_name/main/installer-$arch/current/images/cdrom/"


main() {
	ftp -n <<- EOF
        open $ftp_server
        user anonymous me@linuxbox
        cd $ftp_path
        hash
        get $remote_file
        bye
	EOF
    ls -l $remote_file
}


main
