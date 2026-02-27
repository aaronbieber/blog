#/bin/bash

for file in `find content/posts -type f -iname '*jpg' -or -iname '*png'`; do
  if test "`identify $file | awk '{print $3}' | cut -dx -f1`" -gt 1500; then
    convert "$file" -resize '1500x1500>' -verbose "${file%.*}.jpg"
    rm -f "${file%.*}.png"
  fi
done

for file in `find content/posts -type f -iname '*jpg' -or -iname '*png'`; do
  if test "`ls -l $file | awk '{print $5}'`" -gt 1000000; then
    convert "$file" -resize '1500x1500>' -verbose "${file%.*}.jpg"
    rm -f "${file%.*}.png"
  fi
done
