#!/bin/bash

EXIT=0

while IFS='$\n' read -r line; do
  echo $line

  failed="^(miri: test).*\.\.\.failed$"
  if [[ $line =~ $failed ]]; then
    EXIT=101
  fi
done < "${1:-/dev/stdin}"

exit $EXIT
