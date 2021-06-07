"""" change font
" GuiFont! FiraCode\ NF:h11
GuiFont! Fira\ Code:h11
" GuiFont! Monoid:h11
" GuiFont! Input:h12
" GuiFont! Consolas:h12
" GuiFont! Victor\ Mono:h11
" GuiFont! Ubuntu\ Mono:h12


"""" gui menu
GuiPopupmenu 0

"""" set linespace
"GuiLinespace 2

"""" open maximized
"call GuiWindowMaximized(1)

"""" open fullscreen
"call GuiWindowFullScreen(1)

"""" gui tabline
"GuiTabline 0 or HKEY_CURRENT_USER\Software\nvim-qt\nvim-qt add a new String Value ext_tabline with Data field false

nnoremap <F11> :call MaximizeToggle()<CR>

if !exists('s:ismaximised')
    let s:ismaximised = 0
endif
function! MaximizeToggle()
   let s:ismaximised = !s:ismaximised
   call GuiWindowFullScreen(s:ismaximised)
endfunction
