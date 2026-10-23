@default_files = ('main.tex');
$pdf_mode = 1;
$pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
$bibtex_use = 2;
$hash_calc_ignore_pattern{'xmpi'} = '<xmp:(Modify|Create|Metadata)Date>|<xmpMM:(Instance|Document)ID>';

add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');
sub run_makeglossaries {
  my ($base, $path) = fileparse($_[0]);
  my @args = ('-q', $base);
  unshift @args, '-d', $path if $path ne '';
  return system('makeglossaries', @args);
}

push @generated_exts, qw(glo gls glg acn acr alg ist xdy xmpdata synctex.gz);
push @generated_exts, qw(glo gls glg acn acr alg ist xdy xmpdata xmpi synctex.gz);
