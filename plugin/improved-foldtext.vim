if exists('g:loaded_improved_foldtext')
  finish
endif
let g:loaded_improved_foldtext = 1

function! FoldText()
  let comment_char = split(&commentstring, '%s')[0][0]

  let level = v:foldlevel
  let indent = repeat(comment_char, level)

  let regex = '^'.comment_char.'\+\s*\|\s*{{{\d\s*'
  let title = substitute(getline(v:foldstart), regex, '', 'g')

  let foldsize = (v:foldend - v:foldstart)
  let linecount = '['.foldsize.' line'.(foldsize>1?'s':'').']'

  return indent.' '.title.' '.linecount
endfunction

set foldtext=FoldText()
