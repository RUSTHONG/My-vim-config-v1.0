set nu!

set nocompatible

" 设置backspace键
set backspace=indent,eol,start

" 映射键位
inoremap jj <Esc>

" vim-plug插件
call plug#begin('~/.vim/plugged')
" Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
call plug#end()

"设置缩进
set sw=4
set ts=4

"Quickly Run
map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec '!gcc *.c -o %<'
		exec '!time ./%<'
	elseif &filetype == 'cpp'
		exec '!gcc % -o %<'
		exec '!time ./%<'
	elseif &filetype == 'python'
		exec '!time python3 %'
	elseif &filetype == 'java'
		exec '!javac %'
		exec '!java %<'
	elseif &filetype == 'sh'
		:!time bash %
	endif
endfunc

" ................................................................
" Valloric/YouCompleteMe
" ................................................................

"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
let g:ycm_global_ycm_extra_conf= '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"使用ctrl+z完成函数的自动补全
let g:ycm_key_invoke_completion = '<c-z>'
"设置用户只需要输入符号的两个字母，即可自动弹出语义补全
let g:ycm_semantic_triggers = {
						\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
						\ 'cs,lua,javascript': ['re!\w{2}'],
						\ }
"关闭函数原型预览窗口
set completeopt=menu
let g:ycm_add_preview_to_completeopt = 0

" ........................................................................
" plasticboy/vim-markdown
" ........................................................................


" ------------------------------------------------------------------------
" ervandew/supertab
" ------------------------------------------------------------------------
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
