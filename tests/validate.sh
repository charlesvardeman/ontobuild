#!/bin/sh

set -e

JENAVERSION="4.5.0"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )"/.. &> /dev/null && pwd )

if [ -f "/usr/local/jena/bin/riot" ]; then
    RIOT="/usr/local/bin/riot"
else
    RIOT="riot"
fi
ONTPATHS=$(cat $ROOT_DIR/tests/modules.txt | awk -F, '{print $2}')
SHAPEPATHS=$(cat $ROOT_DIR/tests/shapes.txt | awk -F, '{print $2}')

echo "Validating Ontology Modules"
for path in "$ONTPATHS"
do
  "$RIOT" --validate ./$path
done

# echo "Validating Module Shapes"
# for path in "$SHAPEPATHS"
# do
#  "$RIOT" --validate ./$path
# done