vim.cmd [[
try
    colorscheme shado
catch /^Vim\%((\a+)\)\=:E185/
    colorscheme default
    set background=dark
endtry
]]
