"" Latex-Suite config
" compile as pdf
let g:Tex_DefaultTargetFormat='pdf'
" spell check in engrish pleas
set spelllang=en_us spell
" no one uses plaintex
let g:tex_flavor = "latex"
" Move <Alt> bindings to ctrl
imap <C-b> <Plug>Tex_MathBF
imap <C-c> <Plug>Tex_MathCal
imap <C-l> <Plug>Tex_LeftRight
imap <C-i> <Plug>Tex_InsertItemOnThisLine
