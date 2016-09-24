#!/bin/sh

[ ! -d sass ] && bundle install
[ ! -d bourbon ] && bourbon install
[ ! -d neat ] && neat install

sass --load-path bourbon --load-path neat --sourcemap=none sass/application.sass stylesheets/application.css
