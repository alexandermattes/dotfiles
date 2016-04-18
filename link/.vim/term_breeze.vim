
" vim-airline 'term_breeze' theme
" Based on the KDE breeze theme
" To get the right colors in the terminal you have to set the terminal theme to breeze
" since it is using the current terminal colorscheme

let g:airline#themes#term_breeze#palette = {}
let s:gui00 = "#232629"
let s:gui01 = "#da4453"
let s:gui02 = "#2ecc71"
let s:gui03 = "#fdbc4b"
let s:gui04 = "#2980b9"
let s:gui05 = "#8e44ad"
let s:gui06 = "#1abc9c"
let s:gui07 = "#95a5a6"
let s:gui08 = "#31363b"
let s:gui09 = "#ed1515"
let s:gui0A = "#11d116"
let s:gui0B = "#f67400"
let s:gui0C = "#3daee9"
let s:gui0D = "#8e44ad"
let s:gui0E = "#1cdc9a"
let s:gui0F = "#bdc3c7"

let s:cterm00 = 0
let s:cterm01 = 1
let s:cterm02 = 2
let s:cterm03 = 3
let s:cterm04 = 4
let s:cterm05 = 5
let s:cterm06 = 6
let s:cterm07 = 7
let s:cterm08 = 8
let s:cterm09 = 9
let s:cterm0A = 10
let s:cterm0B = 11
let s:cterm0C = 12
let s:cterm0D = 13
let s:cterm0E = 14
let s:cterm0F = 15

let s:N1   = [ s:gui00, s:gui03, s:cterm00, s:cterm03 ]
let s:N2   = [ s:gui0F, s:gui08, s:cterm0F, s:cterm08 ]
let s:N3   = [ s:gui00, s:gui04, s:cterm00, s:cterm04 ]
let g:airline#themes#term_breeze#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#term_breeze#palette.normal_modified = {
      \ 'airline_c': [ s:gui00, s:gui06, s:cterm00, s:cterm06, '' ] ,
      \ }

let s:I1   = [ s:gui00, s:gui0C, s:cterm00, s:cterm0C ]
let s:I2   = s:N2
let s:I3   = s:N3
let g:airline#themes#term_breeze#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#term_breeze#palette.insert_modified = {
      \ 'airline_c': [ s:gui00, s:gui06, s:cterm00, s:cterm06, '' ] ,
      \ }

let s:R1   = [ s:gui00, s:gui01, s:cterm00, s:cterm01 ]
let s:R2   = s:N2
let s:R3   = s:N3
let g:airline#themes#term_breeze#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#term_breeze#palette.replace_modified = {
      \ 'airline_c': [ s:gui00, s:gui06, s:cterm00, s:cterm06, '' ] ,
      \ }

let s:V1   = [ s:gui00, s:gui05, s:cterm00, s:cterm05 ]
let s:V2   = s:N2
let s:V3   = s:N3
let g:airline#themes#term_breeze#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#term_breeze#palette.visual_modified = {
      \ 'airline_c': [ s:gui00, s:gui06, s:cterm00, s:cterm06, '' ] ,
      \ }

let s:IA1   = [ s:gui0F, s:gui08, s:cterm0F, s:cterm08 ]
let s:IA2   = s:IA1
let s:IA3   = s:IA1
let g:airline#themes#term_breeze#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

let g:airline#themes#term_breeze#palette.accents = {
      \ 'red': [ s:gui09, '' , s:cterm09, ''  ]
      \ }
