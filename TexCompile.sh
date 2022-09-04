#!/bin/bash
# Directory=$(pwd)
base=$(basename *.tex)
filename=${base::-4}

# if [[ $Directory = /home/angel/Tesis ]]
# then
#   pdfname=Tesis
# else
#   pdfname=$filename
# fi

case ${1} in
  -P)
    compiler=pdflatex;;
  -L)
    compiler=lualatex;;
  -X)
    compiler=xelatex;;
  *)
    compiler=pdflatex;;
esac

# $compiler --jobname=$pdfname *.tex
$compiler *.tex

if [[ ${2} = -B ]] || [[ ${1} = -B ]] || [[ ${3} = -B ]]
then
  biber $filename
  $compiler *.tex
fi

if [[ ${2} = -Z ]] || [[ ${1} = -Z ]] || [[ ${3} = -Z ]]
then
  zathura $filename.pdf &
fi
