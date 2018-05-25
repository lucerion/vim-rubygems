" ==============================================================
" Description:  Vim plugin for gem command
" Author:       Alexander Skachko <alexander.skachko@gmail.com>
" Homepage:     https://github.com/lucerion/vim-rubygems
" Version:      1.0.0
" Licence:      BSD-3-Clause
" ==============================================================

let s:positions = {
  \ 'current':      'edit',
  \ 'tab':          'tab split',
  \ 'top':          'leftabove split',
  \ 'bottom':       'rightbelow split',
  \ 'left':         'vertical leftabove split',
  \ 'right':        'vertical rightbelow split',
  \ 'top-full':     'topleft split',
  \ 'bottom-full':  'botright split',
  \ 'left-full':    'vertical topleft split',
  \ 'right-full':   'vertical botright split'
  \ }

func! rubygems#gem(args) abort
  exec '!gem ' . a:args
endfunc

func! rubygems#open(gem_name, position) abort
  let l:position = get(s:positions, a:position, s:positions.tab)
  let l:gem_path = substitute(system('gem which ' . a:gem_name), '\n', '', 'g')

  if l:gem_path =~ 'ERROR'
    echohl ErrorMsg | echomsg l:gem_path | echohl None
    return
  endif

  exec l:position . ' ' . l:gem_path
  exec 'lcd ' . fnamemodify(l:gem_path, ':p:h')
endfunc
