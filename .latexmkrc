#!/usr/bin/env perl

$latex = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error -halt-on-error --shell-escape %O %S';
$bibtex = 'upbibtex %O %S';
$dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'mendex %O -o %D %S';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars';

$pdf_mode = 4;
$max_repeat = 10;
