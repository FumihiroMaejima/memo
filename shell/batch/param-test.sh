#!/bin/sh

# example
# $ ./param-test.sh 123 345 679

# paramer count ($#) is not 3 Error & finish。
if [ $# -ne 3 ]; then
  echo "You had set $# parameters." 1>&2
  echo "You need 3 parameters to exectute this batch." 1>&2
  exit 1
fi

# display message by hear document.
cat <<__EOT__
parameter value is here.
  No.1. $1
  No.2. $2
  No.3. $3
count: $#.
__EOT__

exit 0


