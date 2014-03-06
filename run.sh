#!/bin/sh

if [ -z "$PIRANHA_RUNNER" ] ; then
	export PIRANHA_RUNNER=$(realpath "$0")
fi
cd $(dirname $PIRANHA_RUNNER)

case "$1" in
	check)
		shift 1
		if [ $# -eq 0 ] ; then
			for probe in $(find sets -type f -perm /0111) ; do
				echo "check $probe"
				$probe
			done
		else
			cmd=$(ls -1 $1/check* | head -n 1)
			shift 1
			echo -n $cmd "$@"
			if $cmd "$@" ; then
				echo " passed"
			else
				echo " failed"
			fi
		fi
		;;
	*)
		echo "not implemented, try $(basename $0) (check|...)"
		;;
esac
