" ==============================================================
" Description:  Vim plugin for gem command
" Author:       Alexander Skachko <alexander.skachko@gmail.com>
" Homepage:     https://github.com/lucerion/vim-rubygems
" Version:      1.0.0
" Licence:      BSD-3-Clause
" ==============================================================

if exists('g:loaded_rubygems') || &compatible || v:version < 700
  finish
endif
let g:loaded_rubygems = 1

if !exists('g:rubygems_position')
  let g:rubygems_position = 'tab'
endif

func! s:gem_name(input, command_line, cursor_position) abort
  let l:list = map(systemlist('gem list'), 'substitute(v:val, " (.*)", "", "g")')
  return filter(l:list, 'v:val =~ a:input')
endfunc

comm! -nargs=* Gem call rubygems#gem(<q-args>)
comm! -nargs=* -complete=customlist,s:gem_name GemOpen call rubygems#open(<q-args>)
