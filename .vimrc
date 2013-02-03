" Automatische Einrückung (Globale Konfiguration)
" set smartindent
set smarttab

" UTF-8 als Default-Encoding
set enc=utf-8

" Ein Tab entspricht vier Leerzeichen (wie in PEP 8 definiert)
" Dies aber nur für python, damit es nicht mit anderen (ruby, c, Makefiles) kollidiert
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" Besserer Einrückungssupport fuer rst
autocmd FileType rst setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Generelles Syntax-Highlighting
syntax on

" Anzeige der Zeilennummern
set number
