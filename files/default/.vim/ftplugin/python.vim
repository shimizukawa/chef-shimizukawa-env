setlocal softtabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal expandtab
setlocal nosmartindent
setlocal tabstop=8

"" disable omnifunc to using python pythoncomplete#Complete automaticaly.
function! Dummy(findstart, base)
	return ''
endfunction
setlocal omnifunc=Dummy
