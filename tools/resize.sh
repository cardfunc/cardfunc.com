#!/bin/bash
for i in `find "$1" -name "*.JPG"`
do
	mv "$i" "${i%.JPG}.jpg"
done
for i in `find "$1" -name "*.jpg"`
do
	if [[ "$i" != *.original.jpg ]] && [ ! -f "${i%.jpg}.original.jpg" ]
	then
		mv "$i" "${i%.jpg}.original.jpg"
		convert "${i%.jpg}.original.jpg" -resize 950x "$i"
		echo ${i%.jpg}
	fi
done