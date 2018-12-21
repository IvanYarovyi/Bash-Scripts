#!/bin/bash

# stdin: list of authors
# param1: path to file alreadyKnownAuthors.txt
# stdout: list of a new authors

# Usage example: 
# echo "
# akanakasaphapathi = 
# asateeshkumar = " 
# | ~/workspace/newAuthors.sh ~/workspace/cis/cis-docs/alreadyKnownAuthors.txt




cut -d'=' -f1,1 $1 | sort > inputFileKnownAuthors_sorted.tmp
cut -d'=' -f1,1 - | sort > inputStreamAuthors_sorted.tmp
echo "New authors list:"
comm -1 -3 inputFileKnownAuthors_sorted.tmp inputStreamAuthors_sorted.tmp

rm inputFileKnownAuthors_sorted.tmp inputStreamAuthors_sorted.tmp
