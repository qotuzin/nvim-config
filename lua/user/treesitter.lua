local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

configs.setup({
    ensure_installed = 'all', -- one of "all", "maintained" or a list of individual languages to install
    sync_install = false,
    ignore_install = { '' }, -- List of language parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { '' }, -- list of lanuguages to disable syntax highlighing from treesitter
        additional_vim_regex_highlighting = true,
    },
    indent = {enable = true, disable = { '' } },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
})
