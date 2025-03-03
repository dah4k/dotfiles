#!/bin/sh

/usr/bin/rename --all '’' "'" "$@"
/usr/bin/rename --all '：' ':' "$@"
/usr/bin/rename --all '？' '?' "$@"
/usr/bin/rename --all '｜' '|' "$@"
/usr/bin/rename --all '  ' ' ' "$@"
