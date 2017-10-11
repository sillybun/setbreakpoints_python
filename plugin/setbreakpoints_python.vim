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

import setbreakpoints_python
row, col = vim.current.window.cursor

vim.command('normal Oset_trace()')
vim.current.buffer[:], flag = setbreakpoints_python.create_import(list(vim.current.buffer))

if flag:
	vim.current.window.cursor = (row + 2, col)
else:
	vim.current.window.cursor = (row + 1, col)

endOfPython
endfunction


function! RemoveBreakPoint()
python << endOfPython

from setbreakpoints_python import *

row, col = vim.current.window.cursor

if re.search('set_trace\(\)', vim.current.line) is not None:
    vim.command('normal dd')

print(vim.current.buffer)

vim.current.buffer[:], flag = remove_import(list(vim.current.buffer))

if flag and row > 1:
	vim.current.window.cursor = (row - 1, col)

endOfPython
endfunction

function! RemoveAllBreakPoints()
python << endOfPython

from setbreakpoints_python import *

vim.current.buffer[:] = remove_import(remove_breakpoints(list(vim.current.buffer)))

endOfPython
endfunction

function! ToggleBreakPoint()
python << endOfPython

import re

row, memcol = vim.current.window.cursor

if re.search("set_trace\(\)", vim.current.line) is None:
	if row != 1 and re.search("set_trace\(\)", vim.current.buffer[row-2]) is not None:
		vim.command('normal k')
		vim.command('call RemoveBreakPoint()')
		row, col = vim.current.window.cursor
		vim.current.window.cursor = (row, memcol)
	else:
		vim.command('call SetBreakPoint()')
else:
	vim.command('call RemoveBreakPoint()')

endOfPython
endfunction

" --------------------------------
"  Expose our commands to the user
" --------------------------------
command! SetBreakPoint call SetBreakPoint()
command! RemoveAllBreakPoints call RemoveAllBreakPoints()
