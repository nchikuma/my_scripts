FILENAME=$1

column -s$'\t' -t < $FILENAME | less -#2 -N -S
