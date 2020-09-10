#!/bin/bash

myyear=$(date +"%Y")
mymonth=$(date +"%m")

tiddlywiki --save [is[image]tag[header-img]] [addprefix[./images/headers/]]

tiddlywiki --setfield [is[image]tag[header-img]] _canonical_uri $:/blog-headers/templates/canonical-uri-external-image text/plain

tiddlywiki --save [is[image]!tag[header-img]] [addprefix[./images/$myyear/$mymonth/]]

tiddlywiki --setfield [is[image]!tag[header-img]] _canonical_uri $:/blog/templates/canonical-uri-external-image text/plain

rm ./tiddlers/*.{jpg,jpeg,png}

tiddlywiki --render "[page-type[post]publish[yes]]" "[has[created]addsuffix[.html]]" "text/plain" "$:/blog/templates/static.tiddler.html"

tiddlywiki --render "[page-type[index]]" "[has[created]addsuffix[.html]]" "text/plain" "$:/blog/templates/static.tiddler.html"

tiddlywiki --render "[[static.css]]" "[is[tiddler]]" "text/plain"

