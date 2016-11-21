#!/bin/sh

echo "// DO NOT MODIFY THIS FILE, ALL YOUR MODIFICATIONS WILL BE LOST" > sass/_overrides.scss

override=""
nooverride="false"

[ -f _overrides.scss ] && override=_overrides.scss

if [ -n "$1" ]; then
	case $1 in
		--help|-h)
			echo "Usage $0 [-c|path-to-overrides.scss]"
			echo "Where: "
			echo " path-to-overrides.scss : is the path to the file to use as overrides.scss (default ./_overrides.scss"
			echo " -c : ignore overrides (clean build)"
			exit
			;;
		-c)
			nooverride=true
			echo "Ignoring overrides (clean build)"
			;;
		*)
			if [ ! -f $1 ]; then
				echo "$1 file not found"
				exit 2
			fi
			override=$1
			;;
	esac 
fi

[ "$nooverride" = "true" ] && override=""

# Applying overrides
if [ -n "$override" ] ; then
	echo "Applying $override to sass/_overrides.scss" 
	echo "// Applying $override to sass/_overrides.scss"  >> sass/_overrides.scss
	cat $override >> sass/_overrides.scss
fi
# Sanity check:

type sass >/dev/null 2>&1 || bundle install
type bourbon >/dev/null 2>&1 || bundle install
type neat >/dev/null 2>&1 || bundle install

[ ! -d bourbon ] && bourbon install
[ ! -d neat ] && neat install

sass --load-path bourbon --load-path neat --sourcemap=none sass/application.scss stylesheets/application.css
