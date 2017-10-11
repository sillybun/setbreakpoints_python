" --------------------------------
" Add our plugin to the path
" --------------------------------
python import sys
python import vim
python import re
python sys.path.append(vim.eval('expand("<sfile>:h")'))

" --------------------------------
"  Function(s)
" --------------------------------
function! SetBreakPoint()
python << endOfPython

from setbreakpoints_python import *

vim.command('normal Oset_trace()')
vim.current.buffer[:] = create_import(list(vim.current.buffer[:]))

endOfPython
endfunction


function! RemoveBreakPoint()
python << endOfPython

from setbreakpoints_python import *

row, col = vim.current.window.cursor

if re.search('set_trace()', vim.current.line) is not None
    vim.command('normal dd')

vim.current.buffer[:] = remove_import(list(vim.current.buffer))

endOfPython
endfunction

function! RemoveAllBreakPoints()
python << endOfPython

from setbreakpoints_python import *

vim.current.buffer[:] = remove_import(remove_breakpoints(list(vim.current.buffer)))

endOfPython
endfunction

" --------------------------------
"  Expose our commands to the user
" --------------------------------
command! SetBreakPoint call SetBreakPoint()
command! RemoveAllBreakPoints call RemoveAllBreakPoints()
