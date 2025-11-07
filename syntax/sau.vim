" Syntax highlighting for SAU (Scriptable Audio) language used by saugns
" https://codeberg.org/sau/saugns

if exists("b:current_syntax")
  finish
endif

" -----------------
" Comments
" -----------------
" SAU supported comment styles:
"   // line comment
"   /* block comment */
"   #! line comment
"   #Q line comment
"
syntax match  sauComment "//.*$"
syntax region sauComment start="/\*" end="\*/"
syntax match  sauComment "#!.*$"
syntax match  sauComment "#Q.*$"

" -----------------
" Generators
" -----------------
" Main generator types:
"   W - wave oscillator
"   N - noise generator
"   R - rumble / random-line oscillator
"   A - amplitude/DC generator
"
syntax keyword sauGenerator W N R A

" -----------------
" Capital single-letter commands
" -----------------
"  S - sound start command
"  
syntax keyword sauCommand S

" ----------------
" Global contants
" ----------------
"
" Math constants
syntax match sauConst "\<pi\>"
syntax match sauConst "\<mf\>"
" Time-length constant (short default time)
syntax match sauConst "\<T\>"

" -----------------
" Parameters / small identifiers
" -----------------
" This is intentionally loose: single-letter parameter "names"
" like f (frequency), t (time), a (amplitude), p (phase),
" r (rate), c (color), e (envelope), etc.
"
" Standalone parameter letters (a, d, s, f, t, p, r, c, e, m...)
"
syntax match sauParam "\<[ftaprcem]\>"
" Parameter letters when immediately followed by a number or '(',
" e.g. a0.01, d0.1, s1/2, f440, t1, etc.
syntax match sauParam "\<[adrsftpcem]\ze[0-9.(]"

" -----------------
" Numbers
" -----------------
" Integers, floats, and basic fractions
" Examples: 1 3.14 0.01 .25 1/2 -0.5 +.75
"
syntax match sauNumber "[-+]\?\([0-9]\+\(\.[0-9_]\+\)\?\|\.[0-9_]\+\)\>"
syntax match sauNumber "[-+]\?[0-9]\+\/[-+]\?[0-9]\+"

" -----------------
" f-context note & MIDI constants
" -----------------
" Note names: A..G with optional # or b, optional signed octave number (e.g. fC#4, fBb-1)
syntax match sauFConstNote "\%(\<f\)\@<=[A-G]\%([#b]\)\?\%(-\?[0-9]\+\)\?" contains=sauOperator
" MIDI numbers: M0..M127 (we don't enforce 0..127 in regex)
syntax match sauFConstMidi "\%(\<f\)\@<=M[0-9]\{1,3}" contains=sauOperator
" Also support the spaced variable-namespace form: $x = f A4  /  $x = f M69
syntax match sauFConstNote "\%(\<f \)\@<=[A-G]\%([#b]\)\?\%(-\?[0-9]\+\)\?" contains=sauOperator
syntax match sauFConstMidi "\%(\<f \)\@<=M[0-9]\{1,3}" contains=sauOperator

" -----------------
" Variables
" -----------------
" $-prefixed variables, including "magic" ones with $~
"   $seed
"   $foo
"   $~bar
"
syntax match sauVariable "\$[~A-Za-z_][A-Za-z0-9_]*"

" -----------------
" Labels and references
" -----------------
"   'label      - label
"   @label      - reference
"   :label      - also used 
"
" Labels like 'foo, 'name1, '0, 'abc_123
syntax match sauLabel    "'[A-Za-z0-9_]\+"
" References like @foo, @0, :name2, :bar_3
syntax match sauLabelRef "[@:][A-Za-z0-9_]\+"

" -----------------
" Operators & punctuation
" -----------------
" Basic arithmetic / punctuation
syntax match sauOperator "[-+*%^(),\[\]=]"

" Dot before a sub-parameter token (e.g. .l, .llin), but NOT a decimal point
syntax match sauOperator "\.\ze[A-Za-z_]"

" Slash as an operator only when surrounded by spaces (avoid // comments & 1/2)
syntax match sauOperator "\s\zs/\ze\s"

" -----------------
" Highlight groups links
" -----------------
hi def link sauComment	   Comment
hi def link sauGenerator   Keyword
hi def link sauCommand     Statement
hi def link sauConst       Constant
hi def link sauParam       Identifier
hi def link sauNumber      Number
hi def link sauFConstNote  Constant
hi def link sauFConstMidi  Constant
hi def link sauVariable    Identifier
hi def link sauLabel       Type
hi def link sauLabelRef    Type
hi def link sauOperator    Operator

let b:current_syntax = "sau"
