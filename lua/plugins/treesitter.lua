require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "javascript", 
        "c", 
        "lua",
        "vim",
        "vimdoc", 
        "query", 
        "cpp", 
        "typescript", 
        "python",
        "prisma"
    },

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,
    }
}
