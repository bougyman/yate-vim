" Vim syntax file
" Language:    Yate regexroute conf file
" Maintainer:  TJ Vanderpoel <tj@rubyists.com>
" Last Change: 2012 Mar 18
" Remark:      Original version
"----------------------------------------------------------------
let b:current_syntax = "regexroute"

syn keyword yateKeyword contained goto fork return lateroute tone zap call dispatch if include jump match rename enqueue echo

syn keyword yateTodo contained TODO FIXME XXX NOTE
syn match yateComment /^;.*$/ contains=yateTodo

syn match sectionName /[[:alpha:]]*/ contained display
syn region sectionHeader start=/^\[/ end=/\]$/ contains=sectionName

syn match yateVariable /[[:alnum:]]*/ contained
syn region yateVarHolder start=/\${/ end=/}/ contained contains=yateVariable

syn match yateDollar '\$=' contained contains=yateEqual
syn match yateCarat '\^' contained
syn match yateAmpersand '@' contained
syn match yateSlash '/' contained
syn match yateEqual '=' contained
syn match yateSemiColon ';' contained
syn match yateEscape /\\[0-9]/ contained
syn cluster yateOperators contains=yateSemiColon,yateDollar,yateCarat,yateAmpersand,yateSlash,yateEqual,yateEscape

syn match sipUri /sip\/[^@]*@[^[:space:];]*/ contained contains=yateSlash,yateAmpersand,yateEscape
syn match h323Uri /h323\/[^@]*@[^[:space:];]*/ contained contains=yateSlash,yateAmpersand,yateEscape
syn match iaxUri /iax\/[^@]*@[^[:space:];]*/ contained contains=yateSlash,yateAmpersand,yateEscape
syn cluster yateUri contains=sipUri,h323Uri,iaxUri

syn region charGroup matchgroup=yateChars start=/\\(/ end=/\\)/ contained
syn region charClass matchgroup=yateChars start=/\[/ end=/\]/ contained
syn match yateCond /[[:alpha:]]*[[:space:]]*=/ contained contains=yateEqual nextgroup=yateVal skipwhite
syn match yateVal /[^$;]*/ contained contains=yateVarHolder
syn match yateString /[a-zA-Z]/ contained

syn match yateRule /^[^=]*=/ contains=yateComment,yateString,charGroup,charClass,yateVarHolder,yateCarat,yateDollar,yateEqual nextgroup=yateActions skipwhite
syn match yateActions /.*$/ contains=yateCond,yateVarHolder,@yateUri,yateKeyword,@yateOperators contained skipwhite

hi def link yateComment     Comment
hi def link yateSemiColon   Comment
hi def link yateVariable    Comment
hi def link yateRule        Conceal
hi def link yateNumber      Constant
hi def link yateEqual       Operator
hi def link yateAmpersand   Operator
hi def link yateSlash       Operator
hi def link yateKeyword     Special
hi def link sectionHeader   Special
hi def link yateCarat       Special
hi def link yateDollar      Special
hi def link yateEscape      Special
hi def link yateVarHolder   Special
hi def link yateChars       Statement
hi def link yateCond        Statement
hi def link sectionName     Statement
hi def link yateVal         String
hi def link yateActions     String
hi def link yateTodo        Todo
hi def link sipUri          Type
hi def link iaxUri          Type
hi def link h323Uri         Type
hi def link charClass       Type
hi def link charGroup       Type
hi def link yateString      Type
