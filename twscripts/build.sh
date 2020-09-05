#!/bin/bash
tiddlywiki ./myblog --render "[page-type[post]publish[yes]]" "[has[created]addsuffix[.html]]" "text/plain" "$:/blog/templates/static.tiddler.html"

tiddlywiki ./myblog --render "[page-type[index]]" "[has[created]addsuffix[.html]]" "text/plain" "$:/blog/templates/static.tiddler.html"

tiddlywiki ./myblog --render "[[static.css]]" "[is[tiddler]]" "text/plain"
