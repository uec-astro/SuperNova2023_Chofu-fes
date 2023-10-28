#!/bin/bash

if [ ! -z "$GITHUB_ACTIONS" ]; then
    cp /.latexmkrc $HOME/
fi

latexmk -lualatex -silent -outdir=./out -cd -shell-escape -f ./main.tex
