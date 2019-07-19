hi Statement cterm=bold
hi Type cterm=bold
hi Function cterm=bold

syn match cCustomParen "?=(" contains=cParen,cCppParen
syn match cCustomFunc  "\w\+\s*(\@=" contains=cCustomParen
syn match cCustomScope "::"
syn match cCustomClass "\w\+\s*::" contains=cCustomScope

hi def cCustomClass ctermfg=Blue
hi def cCustomFunc ctermfg=Blue
hi def cCustomScope ctermfg=Red
