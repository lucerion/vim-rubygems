" ==============================================================
" Description:  Vim plugin for ruby `gem` command
" Author:       Alexander Skachko <alexander.skachko@gmail.com>
" Homepage:     https://github.com/lucerion/vim-rubygems
" Version:      1.0.0
" Licence:      BSD-3-Clause
" ==============================================================

func! rubygems#gem(args) abort
  exec '!gem ' . a:args
endfunc

func! rubygems#open(gem_name, mods) abort
  let l:gem_path = substitute(system('gem which ' . a:gem_name), '\n', '', 'g')
  if l:gem_path =~ 'ERROR'
    echohl ErrorMsg | echomsg l:gem_path | echohl None
    return
  endif

  silent exec a:mods . ' split ' . l:gem_path
  if g:cd_to_gem_directory
    silent exec 'lcd ' . fnamemodify(l:gem_path, ':p:h')
  endif
endfunc
