""help function-list
""help feature-list
syntax on
set hlsearch
set mouse=a
set tabstop=4
set shiftwidth=4
set bs=2
set ruler
set nu
set incsearch
set nowrap
set ignorecase
set smartcase
"" set cursor for high light
""set cursorcolumn
set cursorline

set ft=verilog
if v:progname =~? "evim"
  finish
endif
""

""set cuc
""set cul
""set cursorcolumn
""inoremap <F7>   <esc>:set cursorcolumn!<CR>
""noremap  <F7>   <esc>:set cursorcolumn!<CR>
""inoremap <S-F7> <esc>:set cursorcolumn!<CR>
""noremap  <S-F7> <esc>:set cursorcolumn!<CR>
"""set scrollbind
"Map
inoremap <tab> <space><space><space><space>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
""inoremap " ""<left>
""inoremap ` ``<left>
"inoremap jj  <esc><right>

""Horizial scroll bar
"noremap <c-l> 4z<right>
"noremap <c-h> 4z<left>

""Jump among windows
nnoremap <tab>   <c-w>w
nnoremap <s-tab> <c-w>W

""Jump among windows
nnoremap gf      :vs <cfile><CR><c-w>x<c-w>w
nnoremap fg      :sp <cfile><CR><c-w>x<c-w>w
""nnoremap <F2>    :vs ../src/<cfile>.c<CR><c-w>x
"==================Project SC32==============================="
"nnoremap <F2>    :vs ../testcase_i/<cfile>.c<CR><c-w>x
nnoremap <F8>    :vs ../log/<cfile>_cm4_compile.log<CR><c-w>x
nnoremap <F4>    :vs ../log/<cfile>.log<CR><c-w>x
nnoremap <F2>    :vs ../testcase_i/<cfile>/cpu.c<CR><c-w>x
nnoremap <F3>    :vs ../testcase_i/<cfile>/model_util.sv<CR><c-w>x
nnoremap <F6>    :vs ../testcase_i/<cfile>.c<CR><c-w>x
nnoremap <F7>    :vs ../testcase_i/<cfile>.sv<CR><c-w>x
"======================= Project Tahoe =============================="
"nnoremap <F6>    :vs ../src/<cfile>.c<CR><c-w>x
"nnoremap <F7>    :vs ../log/<cfile>_cm4_compile.log<CR><c-w>x
"nnoremap <S-F7>    :vs ../log/<cfile>_cm4_compile.log<CR><c-w>x
"nnoremap <C-F7>    :vs ../log/<cfile>_dsp1_compile.log<CR><c-w>x
"nnoremap <C-S-F7>    :vs ../log/<cfile>_dsp2_compile.log<CR><c-w>x
"nnoremap <F8>    :vs ../log/<cfile>_vcs.log<CR><c-w>x
""nnoremap <F7>    :vs ../src/<cfile>.dat<CR><c-w>x
""nnoremap <F6>    :vs ../src/<cfile>.god<CR><c-w>x
"nnoremap  rr    :vs ../src/<cfile>.result<CR><c-w>x
""nnoremap <F8>    :vs ../log/<cfile>.log<CR><c-w>x
"nnoremap  vc     :vs ../log/<cfile>_vcs.log<CR><c-w>x
""=============================================================================================
""nnoremap  c      :vs ../src/<cfile><CR><c-w>x
""nnoremap  v      :vs ../src/<cfile><CR><c-w>x
""nnoremap  vc     :vs ../src/<cfile><CR><c-w>x
"nnoremap <F12>   :vs ../LOGRTL/<cfile>.log<CR><c-w>x
"nnoremap <F12>   :vs ../LOGRTL/<cfile>.log<CR><c-w>x<c-w>wG

"Expand vi window"
noremap  <F5>    <c-w><bar>
inoremap <F5>    <esc><c-w><bar>gi
noremap  <S-F5>  <c-w>_
inoremap <S-F5>  <esc><c-w>_gi
noremap   =      <c-w>=

"Search word under cursor backward then jump back current position"
nnoremap #	#N
"Search word under cursor forward then jump back current position"
nnoremap *	*N

"Remember cursor position"
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

"Auto detect file type"
au BufNewFile,BufRead   *.src,*.list,*lis				set filetype=asm
au BufNewFile,BufRead   *.cpp,*.CPP						set filetype=cpp
au BufNewFile,BufRead   *.v,*.V,*.if,*.sv,*.pat	    	set filetype=verilog
"___________________________
"
"       Highlighting
"___________________________

if ($TERM == "xterm")
   set t_Co=256                        "Enable 256-color mode
endif

""fun! Vwhereami()
""    let modstart=search('^\s*module\s','bnW')
""    let line=getline(modstart)
""    let modname=substitute(line,'^\s*module\s\+\(\w\+\).*',"\\1","")
""    highlight VerilogTrace ctermbg=green guibg=green 
""    exec "normal \<C-W>w" 
""    exec "match VerilogTrace /" . modname . "/" 
""    call search("(\<" . modname . "\>)","W") 
""    exec "normal \<C-W>w"
""endfunction
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis


if (&t_Co == 256)
     ""set cursorline nocursorcolumn
     set cursorcolumn
     highlight   Search          cterm=none  ctermbg=11
"    highlight   CursorLine      cterm=none  ctermbg=238
   ""highlight   CursorColumn    cterm=none  ctermbg=253
     highlight   CursorColumn    cterm=none  ctermbg=110
     highlight   DiffText        cterm=bold  ctermbg=202   ctermfg=12
     highlight   Pmenu           cterm=none  ctermbg=111
endif
