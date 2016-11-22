#!/bin/sh

# TODO: this script really should be in a .rb file (as any redmine user would have ruby installed anyway), PR welcomed


override="overrides"
nooverride="false"

[ -f _overrides.scss ] && override=_overrides.scss

if [ -n "$1" ]; then
	case $1 in
		--help|-h)
			echo "Usage $0 [-c|path-to-overrides-directory]"
			echo "Where: "
                        echo " path-to-overrides-directory: is the path containing the overrides scss files (_overrides.scss _variables_overrides.scss and _variables_usage_overrides.scss) "
                        echo "   (the directory may be empty or simply contains any of those files, no error will be thrown) "
			echo " -c : ignore overrides (clean build)"
			exit
			;;
		-c)
			nooverride=true
			echo "Ignoring overrides (clean build)"
			;;
		*)
			if [ ! -d $1 ]; then
                            echo "$1 override directory not found (or not a directory)"
                            exit 2
			fi
			override=$1
			;;
	esac 
fi

[ "$nooverride" = "true" ] && override=""

for file in _overrides.scss _variables_overrides.scss _variables_usage_overrides.scss ; do
    echo "// DO NOT MODIFY THIS FILE, ALL YOUR MODIFICATIONS WILL BE LOST" > sass/$file

    # Applying overrides
    if [ -n "$override" -a -f "$override/$file" ] ; then
            echo "Applying $override/$file to sass/$file" 
            echo "// Applying $override/$file to sass/$file"  >> sass/_overrides.scss
            cat $override/$file >> sass/$file
    fi

done

# Sanity check:

type sass >/dev/null 2>&1 || bundle install
type bourbon >/dev/null 2>&1 || bundle install
type neat >/dev/null 2>&1 || bundle install

[ ! -d bourbon ] && bourbon install
[ ! -d neat ] && neat install

sass --load-path bourbon --load-path neat --sourcemap=none sass/application.scss stylesheets/application.css
