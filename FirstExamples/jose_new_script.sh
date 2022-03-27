#!/usr/bin/env bash
# jose_new_script.sh: script to show the gordillo my coding style.

# __author__ = 'Jose Subero <arawako@gmail.com>'
# __reviewer__ = 'Ruben Ricaurte <ricaurtef@gmail.com>'

# Abort script at first error, when a command exits with non-zero status
# (except in until or while loops, if-tests, list constructs)
set -o errexit

RETAIL=$2
LOCAL=$4
LAUNCH=$6
FINISH=$8
DATE=$(date +%s)
START=$(date --date="${LAUNCH}:00:00" +%s)
STOP=$(date --date="${FINISH}:00:00" +%s)
CMD="/usr/bin/pgrep -f 'launch.sh --retail ${RETAIL} --local ${LOCAL}'"
runningProcess=$(eval "$CMD")

if [[ -n $runningProcess ]]; then
  echo "$RETAIL is runnig"
  exit 0
elif [[ $DATE -ge $START ]] && [[ $DATE -lt $STOP ]]; then

  cd "$(dirname "$0")" || return

  export TERM=xterm

  print_status() {
    message="$1"
    status="$2"
    columns=$(tput cols)
    space=$((columns - 8))
    printf "%-*s [%s] \n" "$space" "$message" "$status"
  }

  execNode="node"
  if node_version=$($execNode -v | tr ".v" " "); then
    print_status "GET NODE VERSION" "OK"
  fi
  mayor_version=$(echo "$node_version" | cut -f2 -d" ")
  if [ "$mayor_version" -lt 10 ]; then
    print_status "NODE VERSION IS DEPRECATED" "FAIL"
    exit 1
  else
    print_status "NODE VERSION" "OK"
  fi

  if [ -f "package.json" ]; then
    sudo CG_LEVEL=info RETAIL="${RETAIL}" LOCAL="${LOCAL}" NODE_ENV=production $execNode bin/noStock

    if [ $? -ne 0 ]; then
      print_status "getData" "FAIL"
      exit 1
    else
      print_status "getData" "OK"
    fi
  else
    echo "directory is not a node type"
    print_status "NPM INSTALL" "FAIL"
    exit 1
  fi
fi
