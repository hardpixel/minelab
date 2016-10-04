#!/bin/sh

echo "// DO NOT MODIFY THIS FILE, ALL YOUR MODIFICATIONS WILL BE LOST" > sass/_overrides.scss

if [ -n "$1" ]; then
	case $1 in
		--help|-h)
			echo "Usage $0 [path-to-overrides.scss]"
			exit
			;;
		*)
			if [ ! -f $1 ]; then
				echo "$1 file not found"
				exit 2
			fi
			echo "Applying $1 to sass/_overrides.scss"
			cat $1 >> sass/_overrides.scss
			;;
		
	esac 
fi

# Sanity check:

type sass >/dev/null 2>&1 || bundle install
type bourbon >/dev/null 2>&1 || bundle install
type neat >/dev/null 2>&1 || bundle install

[ ! -d bourbon ] && bourbon install
[ ! -d neat ] && neat install

sass --load-path bourbon --load-path neat --sourcemap=none sass/application.scss stylesheets/application.css
