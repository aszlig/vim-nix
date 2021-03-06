" Vim syntax file
" Language:    Nix
" Maintainer:  Daiderd Jordan <daiderd@gmail.com>
" URL:         https://github.com/LnL7/vim-nix

if exists("b:current_syntax")
  finish
endif

syn keyword nixBoolean     true false null
syn keyword nixConditional if then else
syn keyword nixKeyword     let in rec inherit with import throw

syn keyword nixOperator and or not
syn match   nixOperator '!=\|!'
syn match   nixOperator '&&'
syn match   nixOperator '//'
syn match   nixOperator '=='
syn match   nixOperator '?'
syn match   nixOperator '||'

syn keyword nixFunction
      \ currentSystem currentTime isFunction getEnv trace toPath pathExists
      \ readFile toXML toFile filterSource attrNames getAttr hasAttr isAttrs
      \ listToAttrs isList head tail add sub lessThan substring stringLength

syn keyword nixTodo FIXME NOTE TODO OPTIMIZE XXX HACK contained
syn match   nixComment '#.*' contains=nixTodo
syn region  nixComment start=+/\*+ skip=+\\"+ end=+\*/+

syn match  nixInterpolationParam '\k\+' contained
syn match  nixInterpolation '\$\k\+' contained
syn region nixInterpolation matchgroup=nixInterpolationDelimiter start="${" end="}" contained contains=nixInterpolationParam

syn region nixString matchgroup=nixStringDelimiter start=+"+   skip=+\\"|\\\\+     end=+"+  contains=nixInterpolation
syn region nixString matchgroup=nixStringDelimiter start=+''+  skip=+'''\|''${\|"+ end=+''+ contains=nixInterpolation

syn match  nixPath "\%(:\|\.\|\k\)\+\/\%(:\|\.\|\/\|\k\)\+"
syn region nixPath matchgroup=nixPathDelimiter start="<" end=">" contains=nixPath

syn match nixArgument  "\k\+\ze\s*:/\@!"
syn match nixAttribute "\k\+\ze\s*==\@!"

hi def link nixArgument               Identifier
hi def link nixFunction               Function
hi def link nixAttribute              Identifier
hi def link nixBoolean                Boolean
hi def link nixComment                Comment
hi def link nixConditional            Conditional
hi def link nixInterpolation          Macro
hi def link nixInterpolationDelimiter Delimiter
hi def link nixInterpolationParam     Macro
hi def link nixKeyword                Keyword
hi def link nixOperator               Operator
hi def link nixPath                   Include
hi def link nixPathDelimiter          Delimiter
hi def link nixString                 String
hi def link nixStringDelimiter        Delimiter
hi def link nixTodo                   Todo
