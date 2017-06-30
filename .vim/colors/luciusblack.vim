" vim: ft=vim fdm=marker

set background=dark
hi clear
if exists('syntax_on')
    syntax reset
endif
let colors_name = 'luciusblack'

if &t_Co >= 256 || has('gui_running')
    hi Normal           ctermfg=7           ctermbg=16          cterm=NONE
    hi Normal           guifg=#aeaeae       guibg=#000000       gui=NONE

    hi ColorColumn      ctermfg=NONE        ctermbg=236         cterm=NONE
    hi ColorColumn      guifg=NONE          guibg=#303030       gui=NONE
    hi Comment          ctermfg=242         ctermbg=NONE        cterm=NONE
    hi Comment          guifg=#6c6c6c       guibg=NONE          gui=NONE
    hi Constant         ctermfg=174         ctermbg=NONE        cterm=NONE
    hi Constant         guifg=#d78787       guibg=NONE          gui=NONE
    hi Cursor           ctermfg=bg          ctermbg=153         cterm=NONE
    hi Cursor           guifg=bg            guibg=#afd7ff       gui=NONE
    hi CursorColumn     ctermfg=NONE        ctermbg=236         cterm=NONE
    hi CursorColumn     guifg=NONE          guibg=#303030       gui=NONE
    hi CursorIM         ctermfg=bg          ctermbg=116         cterm=NONE
    hi CursorIM         guifg=bg            guibg=#87d7d7       gui=NONE
    hi CursorLine       ctermfg=NONE        ctermbg=236         cterm=NONE
    hi CursorLine       guifg=NONE          guibg=#303030       gui=NONE
    hi CursorLineNr     ctermfg=231         ctermbg=233         cterm=NONE
    hi CursorLineNr     guifg=#ffffff       guibg=#121212       gui=NONE
    hi DiffAdd          ctermfg=15          ctermbg=241         cterm=NONE
    hi DiffAdd          guifg=#dddddd       guibg=#626262       gui=NONE
    hi DiffChange       ctermfg=15          ctermbg=241         cterm=NONE
    hi DiffChange       guifg=#dddddd       guibg=#626262       gui=NONE
    hi DiffDelete       ctermfg=bg          ctermbg=241         cterm=NONE
    hi DiffDelete       guifg=bg            guibg=#626262       gui=NONE
    hi DiffText         ctermfg=231         ctermbg=1           cterm=NONE
    hi DiffText         guifg=#ffffff       guibg=#9d2d2d       gui=NONE
    hi Directory        ctermfg=151         ctermbg=NONE        cterm=NONE
    hi Directory        guifg=#afd7af       guibg=NONE          gui=NONE
    hi Error            ctermfg=167         ctermbg=234         cterm=NONE
    hi Error            guifg=#d75f5f       guibg=#1c1c1c       gui=NONE
    hi ErrorMsg         ctermfg=231         ctermbg=1           cterm=NONE
    hi ErrorMsg         guifg=#ffffff       guibg=#9d2d2d       gui=NONE
    hi FoldColumn       ctermfg=250         ctermbg=233         cterm=NONE
    hi FoldColumn       guifg=#bcbcbc       guibg=#121212       gui=NONE
    hi Folded           ctermfg=244         ctermbg=233         cterm=NONE
    hi Folded           guifg=#808080       guibg=#121212       gui=NONE
    hi Identifier       ctermfg=156         ctermbg=NONE        cterm=NONE
    hi Identifier       guifg=#afff87       guibg=NONE          gui=NONE
    hi Ignore           ctermfg=bg          ctermbg=NONE        cterm=NONE
    hi Ignore           guifg=bg            guibg=NONE          gui=NONE
    hi IncSearch        ctermfg=bg          ctermbg=231         cterm=NONE
    hi IncSearch        guifg=bg            guibg=#ffffff       gui=NONE
    hi LineNr           ctermfg=244         ctermbg=233         cterm=NONE
    hi LineNr           guifg=#808080       guibg=#121212       gui=NONE
    hi MatchParen       ctermfg=46          ctermbg=NONE        cterm=bold
    hi MatchParen       guifg=#00ff00       guibg=NONE          gui=bold
    hi ModeMsg          ctermfg=117         ctermbg=NONE        cterm=NONE
    hi ModeMsg          guifg=#87d7ff       guibg=NONE          gui=NONE
    hi MoreMsg          ctermfg=228         ctermbg=NONE        cterm=NONE
    hi MoreMsg          guifg=#ffff87       guibg=NONE          gui=NONE
    hi NonText          ctermfg=238         ctermbg=NONE        cterm=NONE
    hi NonText          guifg=#444444       guibg=NONE          gui=NONE
    hi PMenuSbar        ctermfg=NONE        ctermbg=59          cterm=NONE
    hi PMenuSbar        guifg=NONE          guibg=#5f5f5f       gui=NONE
    hi PMenuThumb       ctermfg=NONE        ctermbg=102         cterm=NONE
    hi PMenuThumb       guifg=NONE          guibg=#878787       gui=NONE
    hi Pmenu            ctermfg=243         ctermbg=232         cterm=NONE
    hi Pmenu            guifg=#767676       guibg=#080808       gui=NONE
    hi PmenuSel         ctermfg=185         ctermbg=234         cterm=NONE
    hi PmenuSel         guifg=#d7d75f       guibg=#1c1c1c       gui=NONE
    hi PreProc          ctermfg=167         ctermbg=NONE        cterm=NONE
    hi PreProc          guifg=#d75f5f       guibg=NONE          gui=NONE
    hi Question         ctermfg=fg          ctermbg=NONE        cterm=NONE
    hi Question         guifg=fg            guibg=NONE          gui=NONE
    hi Search           ctermfg=bg          ctermbg=214         cterm=NONE
    hi Search           guifg=bg            guibg=#ffaf00       gui=NONE
    hi SignColumn       ctermfg=145         ctermbg=233         cterm=NONE
    hi SignColumn       guifg=#afafaf       guibg=#121212       gui=NONE
    hi Special          ctermfg=231         ctermbg=NONE        cterm=NONE
    hi Special          guifg=#ffffff       guibg=NONE          gui=NONE
    hi SpecialKey       ctermfg=238         ctermbg=NONE        cterm=NONE
    hi SpecialKey       guifg=#444444       guibg=NONE          gui=NONE
    hi SpellBad         ctermfg=231         ctermbg=1           cterm=NONE
    hi SpellBad         guifg=#ffffff       guibg=#9d2d2d       gui=NONE
    hi SpellCap         ctermfg=bg          ctermbg=228         cterm=NONE
    hi SpellCap         guifg=bg            guibg=#ffff87       gui=NONE
    hi SpellLocal       ctermfg=231         ctermbg=5           cterm=NONE
    hi SpellLocal       guifg=#ffffff       guibg=#a43fa4       gui=NONE
    hi SpellRare        ctermfg=231         ctermbg=4           cterm=NONE
    hi SpellRare        guifg=#ffffff       guibg=#384580       gui=NONE
    hi Statement        ctermfg=228         ctermbg=NONE        cterm=NONE
    hi Statement        guifg=#ffff87       guibg=NONE          gui=NONE
    hi StatusLine       ctermfg=231         ctermbg=237         cterm=bold
    hi StatusLine       guifg=#ffffff       guibg=#3a3a3a       gui=bold
    hi StatusLineNC     ctermfg=244         ctermbg=237         cterm=NONE
    hi StatusLineNC     guifg=#808080       guibg=#3a3a3a       gui=NONE
    hi TabLine          ctermfg=244         ctermbg=237         cterm=NONE
    hi TabLine          guifg=#808080       guibg=#3a3a3a       gui=NONE
    hi TabLineFill      ctermfg=187         ctermbg=237         cterm=NONE
    hi TabLineFill      guifg=#d7d7af       guibg=#3a3a3a       gui=NONE
    hi TabLineSel       ctermfg=231         ctermbg=237         cterm=bold
    hi TabLineSel       guifg=#ffffff       guibg=#3a3a3a       gui=bold
    hi Title            ctermfg=74          ctermbg=NONE        cterm=NONE
    hi Title            guifg=#5fafd7       guibg=NONE          gui=NONE
    hi Todo             ctermfg=185         ctermbg=234         cterm=NONE
    hi Todo             guifg=#d7d75f       guibg=#1c1c1c       gui=NONE
    hi Type             ctermfg=110         ctermbg=NONE        cterm=NONE
    hi Type             guifg=#87afd7       guibg=NONE          gui=NONE
    hi Underlined       ctermfg=fg          ctermbg=NONE        cterm=underline
    hi Underlined       guifg=fg            guibg=NONE          gui=underline
    hi VertSplit        ctermfg=243         ctermbg=237         cterm=NONE
    hi VertSplit        guifg=#767676       guibg=#3a3a3a       gui=NONE
    hi Visual           ctermfg=NONE        ctermbg=235         cterm=NONE
    hi Visual           guifg=NONE          guibg=#262626       gui=NONE
    hi VisualNOS        ctermfg=fg          ctermbg=NONE        cterm=underline
    hi VisualNOS        guifg=fg            guibg=NONE          gui=underline
    hi WarningMsg       ctermfg=228         ctermbg=NONE        cterm=NONE
    hi WarningMsg       guifg=#ffff87       guibg=NONE          gui=NONE
    hi WildMenu         ctermfg=bg          ctermbg=185         cterm=bold
    hi WildMenu         guifg=bg            guibg=#d7d75f       gui=bold
endif

hi link Boolean                         Constant
hi link Character                       Constant
hi link Conditional                     Statement
hi link Debug                           Special
hi link Define                          PreProc
hi link Delimiter                       Special
hi link Exception                       Statement
hi link Float                           Number
hi link Function                        Identifier
hi link HelpCommand                     Statement
hi link HelpExample                     Statement
hi link Include                         PreProc
hi link Keyword                         Statement
hi link Label                           Statement
hi link Macro                           PreProc
hi link Number                          Constant
hi link Operator                        Statement
hi link PreCondit                       PreProc
hi link Repeat                          Statement
hi link SpecialChar                     Special
hi link SpecialComment                  Special
hi link StorageClass                    Type
hi link String                          Constant
hi link Structure                       Type
hi link Tag                             Special
hi link Typedef                         Type
hi link asciidocQuotedEmphasized        PreProc
hi link diffAdded                       String
hi link diffBDiffer                     WarningMsg
hi link diffCommon                      WarningMsg
hi link diffDiffer                      WarningMsg
hi link diffIdentical                   WarningMsg
hi link diffIsA                         WarningMsg
hi link diffNoEOL                       WarningMsg
hi link diffOnly                        WarningMsg
hi link diffRemoved                     WarningMsg
hi link htmlBold                        Normal
hi link htmlEndTag                      htmlTagName
hi link htmlItalic                      Normal
hi link htmlLink                        Function
hi link htmlSpecialTagName              htmlTagName
hi link htmlTag                         htmlTagName
hi link markdownItalic                  PreProc
hi link xmlEndTag                       Statement
hi link xmlTag                          Statement
hi link xmlTagName                      Statement
