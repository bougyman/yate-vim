" Vim syntax file
" Language:    Yate regexroute conf file
" Maintainer:  TJ Vanderpoel <tj@rubyists.com>
" Last Change: 2012 Mar 18
" Remark:      Original version
"----------------------------------------------------------------
let b:current_syntax = "regexroute"

syn keyword yateKeyword contained goto fork return lateroute tone zap call dispatch if include jump match rename enqueue echo

syn keyword yateTodo contained TODO FIXME XXX NOTE
syn match yateComment /^[[:space:]]*;.*$/ contains=yateTodo

syn region sectionHeader matchgroup=sectionName start=/^\[/ end=/\]$/
syn region yateVarHolder matchgroup=yateVariable start=/\${/ end=/}/ contained
syn region yateFunction matchgroup=yateChars start=/\$(/ end=/)/ contained contains=yateComma

syn match yateDollar '\$=' contained contains=yateEqual
syn match yateCarat '\^' contained
syn match yateComma ',' contained
syn match yateAmpersand '@' contained
syn match yateSlash '/' contained
syn match yateEqual '=' contained
syn match yateSemiColon ';' contained
syn match yateEscape /\\[0-9]/ contained
syn cluster yateOperators contains=yateComma,yateSemiColon,yateDollar,yateCarat,yateAmpersand,yateSlash,yateEqual,yateEscape

syn match sipUri /sip\/[^@]*@[^[:space:];]*/ contained contains=yateSlash,yateAmpersand,yateEscape
syn match h323Uri /h323\/[^@]*@[^[:space:];]*/ contained contains=yateSlash,yateAmpersand,yateEscape
syn match iaxUri /iax\/[^@]*@[^[:space:];]*/ contained contains=yateSlash,yateAmpersand,yateEscape
syn cluster yateUri contains=sipUri,h323Uri,iaxUri

syn region charRange matchgroup=yateChars start=/\\{/ end=/\\}/ contained contains=yateComma
syn region charGroup matchgroup=yateChars start=/\\(/ end=/\\)/ contained
syn region charClass matchgroup=yateChars start=/\[/ end=/\]/ contained
syn match yateCond /[[:alpha:]]*[[:space:]]*=/ contained contains=yateEqual nextgroup=yateVal skipwhite
syn match yateVal /[^$;]*/ contained contains=yateVarHolder
syn match yateString /[a-zA-Z]/ contained

syn match yateRule /^[^=]*=/ contains=yateFunction,yateComment,yateString,charRange,charGroup,charClass,yateVarHolder,yateCarat,yateDollar,yateEqual nextgroup=yateActions skipwhite
syn match yateActions /.*$/ contains=yateFunction,yateCond,yateVarHolder,@yateUri,yateKeyword,@yateOperators contained skipwhite

hi def link yateComment     Comment
hi def link yateSemiColon   Comment
hi def link yateVariable    Comment
hi def link yateRule        Conceal
hi def link yateNumber      Constant
hi def link yateEqual       Operator
hi def link yateAmpersand   Operator
hi def link yateSlash       Operator
hi def link yateComma       Operator
hi def link yateKeyword     Special
hi def link sectionHeader   Special
hi def link yateCarat       Special
hi def link yateDollar      Special
hi def link yateEscape      Special
hi def link yateVarHolder   Special
hi def link yateFunction    Special
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
hi def link charRange       Type
hi def link yateString      Type
