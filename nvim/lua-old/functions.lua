--[[local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})

function _G.smart_tab2()
    return vim.fn.pumvisible() == 1 and t'<C-p>' or t'<S-Tab>'
end

vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.smart_tab2()', {expr = true, noremap = true})

function _G.smart_tab3()
    return vim.fn.pumvisible() == 1 and t'<C-y>' or t'<C-g>u<cr>'
end

vim.api.nvim_set_keymap('i', '<cr>', 'v:lua.smart_tab3()', {expr = true, noremap = true})

function _G.check_back_space()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match('%s')) and true
end
]]
