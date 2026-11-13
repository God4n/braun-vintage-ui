#!/bin/sh
# Joins src/*.html (in name order) into the single-file gallery, index.html.
cd "$(dirname "$0")" && cat src/*.html > index.html && echo "built index.html ($(wc -c < index.html | tr -d ' ') bytes)"
