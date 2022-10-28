#!/bin/bash

mergecmd="rdfx"
files=$(cat tests/modules.txt | awk -F, '{print $2}')
# shapefiles=$(cat tests/shapes.txt | awk -F, '{print $2}')
ONTOLOGY=drone
SHACL=drone.shacl

VERSION=` grep -i versionInfo modules/core/metadata.ttl | sed 's/[^"]*"\([^"]*\).*/\1/'`

if [ -f "./development/merged.ttl" ]; then
    rm ./development/merged.ttl
fi

echo "Merging Ontology"
$mergecmd merge data $files -f ttl -o ./development

# echo "Merging Shapes"
# $mergecmd merge $shapefiles -f ttl -o ./development/raw
#echo "Generating HTML SHACL Shapes Documentation"
# $pylodecmd ./development/${SHACL}.ttl -o ./development/${SHACL}.html

# echo "Generating HTML Ontology Documentation"
# docker run -ti --rm   -v `pwd`/development/ontology:/usr/local/widoco/in   -v `pwd`/development/ontology:/usr/local/widoco/out/doc   dgarijo/widoco -ontFile in/merged.ttl -outFolder out -rewriteAll -webVowl 
# Clean up temp merged file
#if [ -f "./development/ontology/merged.ttl" ]; then
#    rm ./development/ontology/merged.ttl
#fi