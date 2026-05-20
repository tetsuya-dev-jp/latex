use strict;
use warnings;

# uplatex -> dvipdfmx
$pdf_mode = 3;
$latex = 'uplatex -kanji=utf8 -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$dvipdf = 'dvipdfmx %O -o %D %S';

# BibTeX for Japanese documents
$bibtex = 'upbibtex %O %B';

# Build output directory
$out_dir = '.build';

$max_repeat = 5;
@default_files = ('main.tex');
