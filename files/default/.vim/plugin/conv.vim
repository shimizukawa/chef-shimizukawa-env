" -*- vim -*-

command ConvBTM :call ConvertBTM()<CR>
command ConvVISA :call ConvertVISA()<CR>
command ConvSONY :call ConvertSONY()<CR>

"s/^\([^<]*\)\n//g
"s/^<[^>]*>\(.*\)$/\1/g
"s/\([^\n]\)\n\([^\n]\)/\1\t\2/g
"s/\n*\(\n\)/\1/g
"s/OTHER\t[^\t]*\t\([^t]*\)\t\(\d\d\d\d\)\(\d\d\)\(\d\d\)[^\t]*/\1\t\2\/\3\/\4/g
function! ConvertBTM()
    :%s/^\([^<]*\)\n//g
    :%s/^<[^>]*>\(.*\)$/\1/g
    :%s/\([^\n]\)\n\([^\n]\)/\1\t\2/g
    :%s/\n*\(\n\)/\1/g
    :%s/OTHER\t[^\t]*\t\([^t]*\)\t\(\d\d\d\d\)\(\d\d\)\(\d\d\)[^\t]*/\1\t\2\/\3\/\4/g
    :%s/\t\+$//g
endfunction

function! ConvertVISA()
    :%s/^\([^<]*\)\n//g
    :%s/^<[^>]*>\(.*\)$/\1/g
    :%s/\([^\n]\)\n\([^\n]\)/\1\t\2/g
    :%s/\n*\(\n\)/\1/g
    :%s/OTHER\t[^\t]*\t\([^t]*\)\t\(\d\d\d\d\)\(\d\d\)\(\d\d\)[^\t]*/\1\t\2\/\3\/\4/g
    :%s/\(\d\{4\}\)\(\d\{2\}\)\(\d\{2\}\)_\(\d\{2\}\)\(\d\{2\}\)_\d\+_\d\+/\1\/\2\/\3\t\4\/\5/g
    :%s/^\([^\t]*\)\t\([^\t]*\)\t//g
    :%s/\t\+$//g
endfunction

function! ConvertSONY()
    :%s/<FITID>0\n//g
    :%s/^\([^<]*\)\n//g
    :%s/^<[^>]*>\(.*\)$/\1/g
    :%s/\([^\n]\)\n\([^\n]\)/\1\t\2/g
    :%s/\n*\(\n\)/\1/g
    :%s/^PAYMENT\t//g
    :%s/\(\d\d\d\d\)\(\d\d\)\(\d\d\)[^\t]*\t/\1\/\2\/\3\t/g
    :%s/\t*$//g
    :%s/\([^\t]*\)\t\([^\t]*\)\t\([^\t]*\)$/\1\t\3\t\2/g
endfunction

