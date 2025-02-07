#!/bin/sh

# Run the command
latexmk -cd -f -pdf -interaction=batchmode -pdflatex=lualatex -outdir=/data/tmp -auxdir=/data/tmp $@

filename=$(echo $@ | cut -d'.' -f1)
mv "/data/tmp/${filename}.pdf" /data

echo "Data moved to /data/${filename}.pdf"
