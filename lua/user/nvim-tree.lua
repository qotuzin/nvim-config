local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

-- each of these are documented in `:help nvim-tree.OPTION_NAME`

nvim_tree.setup({
    sort_by = 'case_sensitive',
    hijack_cursor = true,
    update_to_buf_dir = {
        enable = true,
        auto_open = true,
    },
    view = {
        adaptive_size = true,
        auto_resize = true,
        hide_root_folder = false,
        mappings = {
            list = {
                { key = 'u', action = 'dir_up' },
                { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
                { key = "h", cb = tree_cb "close_node" },
                { key = "v", cb = tree_cb "vsplit" },
            },
        },
    },
    renderer = {group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
})

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})

vim.api.nvim_set_keymap( 'n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap( 'n', '<leader>s', '<cmd>NvimTreeFindFile<CR>', { noremap = true, silent = true })
