" --------------------------------
" Add our plugin to the path
" --------------------------------
python3 import sys
python3 import vim
python3 import re
python3 sys.path.append(vim.eval('expand("<sfile>:h")'))

" --------------------------------
"  Function(s)
" --------------------------------
function! SetBreakPoint()
python3 << endOfPython

import setbreakpoints_python
row, col = vim.current.window.cursor

vim.command('normal Oset_trace()')
vim.current.buffer[:], flag = setbreakpoints_python.create_import(list(vim.current.buffer), vim.eval('g:setbreakpoint_pdb'))

if flag:
	vim.current.window.cursor = (row + 2, col)
else:
	vim.current.window.cursor = (row + 1, col)

endOfPython
endfunction


function! RemoveBreakPoint()
python3 << endOfPython

from setbreakpoints_python import *

row, col = vim.current.window.cursor

if re.search('set_trace\(\)', vim.current.line) is not None:
    vim.command('normal dd')

print(vim.current.buffer)

vim.current.buffer[:], flag = remove_import(list(vim.current.buffer), vim.eval('g:setbreakpoint_pdb'))

if flag and row > 1:
	vim.current.window.cursor = (row - 1, col)

endOfPython
endfunction

function! RemoveAllBreakPoints()
python3 << endOfPython

from setbreakpoints_python import *

vim.current.buffer[:] = remove_breakpoints(list(vim.current.buffer), vim.eval('g:setbreakpoint_pdb'))

endOfPython
endfunction

function! ToggleBreakPoint()
python3 << endOfPython

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

if !exists('g:setbreakpoint_pdb')
	let g:setbreakpoint_pdb = 1
endif

" --------------------------------
"  Expose our commands to the user
" --------------------------------
command! SetBreakPoint call SetBreakPoint()
command! RemoveAllBreakPoints call RemoveAllBreakPoints()
