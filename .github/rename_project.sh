#!/usr/bin/env bash
while getopts a:n:u:d: flag
do
    case "${flag}" in
        a) author=${OPTARG};;
        n) name=${OPTARG};;
        u) urlname=${OPTARG};;
        d) description=${OPTARG};;
    esac
done

echo "Author: $author";
echo "Project Name: $name";
echo "Project URL name: $urlname";
echo "Description: $description";

echo "Renaming project..."

original_author="ctfree"
original_name="python_tp"
original_urlname="python_tp"
original_description="Awesome python_tp created by ctfree"
# for filename in $(find . -name "*.*") 
for filename in $(git ls-files) 
do
    sed -i "s/$original_author/$author/gI" $filename
    sed -i "s/$original_name/$name/gI" $filename
    sed -i "s/$original_urlname/$urlname/gI" $filename
    sed -i "s/$original_description/$description/gI" $filename
    echo "Renamed $filename"
done

mv python_tp $name

# This command runs only once on GHA!
rm -rf .github/template.yml
