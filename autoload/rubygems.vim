" ==============================================================
" Description:  Vim plugin for gem command
" Author:       Alexander Skachko <alexander.skachko@gmail.com>
" Homepage:     https://github.com/lucerion/vim-rubygems
" Version:      1.0.0
" Licence:      BSD-3-Clause
" ==============================================================

let s:buffer_positions = {
  \ 'top':    'leftabove',
  \ 'bottom': 'rightbelow',
  \ 'left':   'vertical leftabove',
  \ 'right':  'vertical rightbelow',
  \ 'tab':    'tab'
  \ }

func! rubygems#gem(args) abort
  exec '!gem ' . a:args
endfunc

func! rubygems#open(gem_name) abort
  let l:position = get(s:buffer_positions, g:rubygems_position, s:buffer_positions.tab)
  let l:gem_path = substitute(system('gem which ' . a:gem_name), '\n', '', 'g')

  if l:gem_path =~ 'ERROR'
    echohl ErrorMsg | echomsg l:gem_path | echohl None
    return
  endif

  exec l:position . ' split ' . l:gem_path
  exec 'lcd ' . fnamemodify(l:gem_path, ':p:h')
endfunc
