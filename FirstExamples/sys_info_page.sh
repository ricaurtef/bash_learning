#!/usr/bin/env bash
# Program to output a system information page.
# shellcheck disable=SC2059

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


# Global definitions.
progname="$(basename "${0%.*}")"
readonly progname
readonly title="System Information Report For $HOSTNAME"


usage() {
    echo -e "Usage:\n  $progname [-f file | -i]"
    return
}


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
<pre> $(df -h) </pre>
	EOF
    return
}


report_home_space() {
    local format='%8s%10s%10s\n'
    local dir_list="$HOME" i total_files total_dirs total_size user_name


    if (( EUID == 0 )); then
        dir_list="$(dirname "$dir_list")/*"
        user_name='All Users'
    else
        user_name="$USER"
    fi

    echo "<h2>Home space Utilization ($user_name)</h2>"

    for i in $dir_list; do
        total_files="$(find "$i" -type f 2> /dev/null | wc -l)"
        total_dirs="$(find "$i" -type d 2> /dev/null | wc -l)"
        total_size="$(du -sh "$i" 2> /dev/null | cut -f 1)"

        echo "<h3>$i</h3>"
        echo "<pre>"
        printf "$format" "Dirs" "Files" "Size"
        printf "$format" "----" "-----" "----"
        printf "$format" "$total_files" "$total_dirs" "$total_size"
        echo "</pre>"
    done
    return
}


write_html_page() {
    local time_stamp
    time_stamp=$(date +"Generated %x %r %Z, by $USER")

	cat <<- EOF
<!DOCTYPE html>
<html>
  <head>
    <title>$title</title>
  </head>
  <body>
    <h1>$title</h1>
    <p>$time_stamp</p>
    $(report_uptime)
    $(report_disk_space)
    $(report_home_space)
  </body>
</html>
	EOF
    return
}


main() {
    # Process command-line options.
    while [[ -n "$1" ]]; do
        case "$1" in
            -f|--file)
                shift
                filename="$1"
                ;;
            -i|--interactive)
                interactive=true
                ;;
            -h|--help)
                usage
                exit
                ;;
            *)
                usage >&2
                exit 1
                ;;
        esac
        shift
    done

    # Interactive mode.
    if [[ "$interactive" ]] ; then
        while true; do
            read -rp 'Enter name of output file: ' filename
            if [[ -e "$filename" ]]; then
                read -rp "'$filename' exists. Overwrite? [y/n/q] > "
                case "$REPLY" in
                    y|Y)
                        break
                        ;;
                    q|Q)
                        echo 'Program terminated.'
                        exit
                        ;;
                    *)
                        continue
                        ;;
                esac
            elif [[ -z "$filename" ]]; then
                continue
            else
                break
            fi
        done
    fi

    # Output html page.
    if [[ -n "$filename" ]]; then
        if touch "$filename" && [[ -f "$filename" ]]; then
            write_html_page > "$filename"
        else
            echo "$progname: Cannot write file '$filename'." >&2
            exit 1
        fi
    else
        write_html_page
    fi
}


main "$@"
