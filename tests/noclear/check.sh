#!/bin/sh -e

[ -n "$1" ]
egrep -q "^c[0-9].* --noclear .*${1}.*" /etc/inittab

