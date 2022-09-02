#! /usr/bin/env bash
# sys_info_page.sh - Program to output a system information page.

# Author: Ruben Ricaurte <ricaurtef@gmail.com>


# Global definitions.
title="System Information Report For $HOSTNAME"
timestamp="$(date +"Generated %x %r %Z, by $USER")"
readonly title timestamp


report_uptime() {
	cat <<- EOF
<h2>System Uptime</h2>
<pre>$(uptime)</pre>
	EOF

    return
}


report_disk_space() {
	cat <<- EOF
<h2>Disk Space Utilization</h2>
<pre>
$(df -h 2> /dev/null)
</pre>
	EOF

    return
}


report_home_space() {
	cat <<- EOF
<h2>Home Space Utilization</h2>
<pre>
$(du -sh /home/* 2> /dev/null)
</pre>
	EOF

    return
}


main() {
	cat <<- EOF
<html>
    <head>
        <title>$title</title>
    </head>
    <body>
        <h1>$title</h1>
        <p>$timestamp</p>
        $(report_uptime)
        $(report_disk_space)
        $(report_home_space)
    </body>
</html>
	EOF
}


main "$@"
