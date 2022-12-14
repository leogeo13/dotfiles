local keymap_opts = { noremap = true, silent = true }


------------------- PLUGINS --------------------------

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use 'rking/ag.vim'
  use 'rafi/awesome-vim-colorschemes'
  use 'Mofiqul/adwaita.nvim'
  use 'dracula/vim'
  use 'jiangmiao/auto-pairs'
  use 'dense-analysis/ale'
  use 'nvim-treesitter/nvim-treesitter'
  use 'Furkanzmc/zettelkasten.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    }
  }

  -- ddc insanity
  use 'Shougo/ddc.vim'
  use 'vim-denops/denops.vim'
  use 'Shougo/ddc-around'
  use 'Shougo/ddc-matcher_head'
  use 'Shougo/ddc-sorter_rank'
  use 'Shougo/ddc-nvim-lsp'
  use 'delphinus/ddc-treesitter'
end)

------------------- END PLUGINS ----------------------


require('Comment').setup()

--- ddc config ---
local ddc = require('ddc')
ddc.ddc_config()
--- end ddc config


vim.cmd("colorscheme onehalfdark")
vim.cmd('let mapleader = ","')


------------------- EDITOR SETTINGS ------------------

vim.opt.hidden = true
vim.opt.wildmenu = true
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.ruler = true
vim.opt.autoindent = true
vim.opt.startofline = false
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.confirm = true
vim.opt.visualbell = true
vim.opt.laststatus = 2
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.showmatch = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.showmode = false
vim.opt.updatetime = 300
vim.opt.backspace = 'indent,eol,start'
vim.opt.pastetoggle = '<F3>'
vim.opt.signcolumn = 'number'
vim.opt.encoding = 'utf-8'
-- vim.opt.nofoldenable = true
vim.opt.foldlevel = 99
vim.opt_local.foldmethod = 'indent'
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 10
vim.opt.sw = 2
vim.opt.sts = 2
vim.opt.ts = 2
-- vim.opt.wildignore += "*\\tmp\\*,*.swp,*.zip,*.exe,*\\node_modules\\*"
vim.opt.mouse = 'a'
vim.opt.colorcolumn = '74' -- TODO: make this for cpp files only.

-- TODO: keep tabs on this! available in nightly but not 
-- in the current stable release (0.7.x).
-- https://www.reddit.com/r/neovim/comments/xb0hs1/is_it_possible_to_hide_command_line_when_it_is/
vim.opt.cmdheight = 0 -- WOOOOOOOO!

vim.cmd([[
  " custom commands
  command! RefreshConfig source $MYVIMRC

  " NERDTree settings
  let NERDTreeShowHidden=1
  let g:NERDTreeShowBookmarks=1
  let g:NERDSpaceDelims=1
  let g:NERDDefaultAlign='left'
  let g:NERDTreeWinSize=35

  " nvim difftool configuration
  if &diff
    highlight! link DiffText MatchParen
  endif

  " ctrlp settings
  " let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_max_files=0
  let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|node_modules\|log\|tmp$\|dist',
    \ 'file': '\.pyc$\|\.d\.ts$'
    \ }

  " ale settings
  let g:ale_disable_lsp = 1
  let g:ale_linters = {
    \ 'python': ['pylint'],
    \ 'vim': ['vint'],
    \ 'cpp': ['ccls'],
    \ 'c': ['ccls']
\}
]])
------------------- END EDITOR SETTINGS ------------------

------------------- KEY MAPPINGS ---------------------

vim.api.nvim_set_keymap('n', '<Leader>json=', ":%!python3 -m json.tool<CR>", keymap_opts)
vim.api.nvim_set_keymap('n', '<C-n>', ':vnew<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<A-n>', ':new<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><left>', keymap_opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w><down>', keymap_opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w><up>', keymap_opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w><right>', keymap_opts)
vim.api.nvim_set_keymap('n', '<left>', '<C-w><left>', keymap_opts)
vim.api.nvim_set_keymap('n', '<down>', '<C-w><down>', keymap_opts)
vim.api.nvim_set_keymap('n', '<up>', '<C-w><up>', keymap_opts)
vim.api.nvim_set_keymap('n', '<right>', '<C-w><right>', keymap_opts)
vim.api.nvim_set_keymap('n', '<A-,>', ':tabprevious<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<A-.>', ':tabnext<CR>', keymap_opts)
vim.api.nvim_set_keymap('i', '<A-,>', '<Esc>:tabprevious<CR>', keymap_opts)
vim.api.nvim_set_keymap('i', '<A-.>', '<Esc>:tabnext<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F1>', '<cmd>Telescope help_tags<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F2>', '<cmd>Telescope registers<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F3>', '<cmd>Telescope buffers<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F4>', '<cmd>Telescope live_grep<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F5>', ':edit<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F6>', '<cmd> Telescope file_browser<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F7>', '<cmd>Telescope current_buffer_fuzzy_find<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F8>', ':messages<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F9>', ':NvimTreeFocus<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F10>', '<cmd>Telescope git_status<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F11>', '<cmd>Telescope treesitter<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F12>', '<cmd>Telescope lsp_definitions<CR>', keymap_opts)
-- vim.api.nvim_set_keymap('n', '<A-F12>', '<cmd>Telescope lsp_definitions<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<A-F1>', '<cmd>Telescope git_status<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<A-F2>', '<cmd>Telescope git_stash<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<A-F3>', '<cmd>Telescope git_branches<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<A-F4>', '<cmd>Telescope git_commits<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', 'Q', ':q<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', 'W', ':wa<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<leader>1', ':colorscheme onehalflight<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>2', ':colorscheme seoul256-light<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>3', ':colorscheme seoul256<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>4', ':colorscheme adwaita<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>5', ':colorscheme onehalfdark<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>6', ':colorscheme afterglow<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>0', ':colorscheme default<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>ev', ':tabnew $MYVIMRC<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<leader><F5>', ':RefreshConfig<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<leader>h', ':noh<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<Tab>', ':NvimTreeFocus<CR>', keymap_opts)
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', keymap_opts)
vim.api.nvim_set_keymap('i', 'jk', '<Esc>:w<CR>', keymap_opts)
vim.api.nvim_set_keymap('i', '<A-BS>', '<cmd>:execute "normal! db"<CR>', keymap_opts)

-- Comment.nvim
vim.api.nvim_set_keymap('n', '<leader>,', 'gcc', { noremap = false, silent = true })
vim.api.nvim_set_keymap('v', '<leader>,', 'gc', { silent = true })

------------------- END KEY MAPPINGS -----------------

------------------- LSP CONFIG -----------------------

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, keymap_opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, keymap_opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, keymap_opts)
vim.keymap.set('n', '<space>e', vim.diagnostic.setloclist, keymap_opts)
vim.keymap.set('n', 'D', vim.diagnostic.disable, keymap_opts)
vim.keymap.set('n', 'E', vim.diagnostic.enable, keymap_opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<A-F12>', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lspconfig = require('lspconfig')
local lsp_flags = { debounce_text_changes = 50 }

lspconfig.pyright.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

lspconfig.tsserver.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

lspconfig.sumneko_lua.setup {}

lspconfig.ccls.setup {
  on_attach = on_attach,
  flags = lsp_flags
}

-- lspconfig.clangd.setup {
--   on_attach = on_attach,
--   flags = lsp_flags
-- }
------------------- END LSP CONFIG -------------------

------------------- LUALINE CONFIG -------------------

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '????', right = '????' },
    section_separators = { left = '????', right = '????' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = false,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

------------------- END LUALINE CONFIG ---------------

------------------- TELESCOPE CONFIG -----------------

local telescope = require('telescope')

telescope.setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

telescope.load_extension 'file_browser'

------------------- END TELESCOPE CONFIG -------------


--- NVIM-TREE CONFIG ---
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    adaptive_size = false,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "|", action = "vsplit" },
        { key = "s", action = "vsplit" },
        { key = "-", action = "split" },
        { key = "i", action = "split" },
        { key = "t", action = "tabnew" }
      }
    }
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    highlight_opened_files = "icon",
    indent_markers = {
      enable = true
    },
  icons = {
	  show = {
		  file = false, 
		  folder = false, 
		  folder_arrow = false, 
		  git = false
	  }
  	}    
	},
  filters = {
    dotfiles = true
  }
})

--- END NVIM-TREE CONFIG ---

--- TREESITTER ---

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "cpp", "python", "typescript", "c_sharp", "cmake", "ruby", "sql", "markdown" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}

