" Base options
set mouse=a
set number
set relativenumber
set scrolloff=8
set colorcolumn=80
set pumheight=25
set foldmethod=indent
set guicursor+=a:blinkon1
set expandtab
set shiftwidth=2
set smartindent
set tabstop=2
set softtabstop=2
filetype plugin on
filetype indent on
set ignorecase
set smartcase
set nowrap
set splitbelow
set splitright
set updatetime=250
set timeoutlen=500
set termguicolors
syntax on

" Leader
let mapleader = " "

" Quit and save
nmap qq :q<cr>
nmap <leader>w :w!<cr>

" NvimTree
map <F2> :NvimTreeToggle<cr>

" Buffer
nmap <leader>qq :bd<cr>
nmap <leader><right> :bnext<cr>
nmap <leader><left> :bprevious<cr>
nmap <leader>k :bnext<cr>
nmap <leader>j :bprevious<cr>
nmap <leader>br :BufferRestore<cr>
nmap <leader>qa :BufferCloseAllButCurrentOrPinned<cr>
nmap <leader>l :BufferMoveNext<cr>
nmap <leader>h :BufferMovePrevious<cr>
nmap <leader>p :BufferPick<cr>
nmap <leader>bd :BufferPickDelete<cr>
nmap <leader>bp :BufferPin<cr>

" window navigation
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" navigation in insert
imap <A-h> <left>
imap <A-j> <down>
imap <A-k> <up>
imap <A-l> <right>

" No hlsearch
nmap <leader>, :nohlsearch<cr>

" Find
nmap <leader>ff :Telescope find_files<cr>
nmap <leader>fg :Telescope live_grep<cr>
nmap <leader>/ :Telescope current_buffer_fuzzy_find<cr>
nmap <leader>fo :Telescope oldfiles<cr>
nmap <leader>fl :Lines<cr>
nmap <leader>fb :Telescope buffers<cr>

" Rust formatter
nmap <leader>rf :RustFmt<cr>

" Golang formatters
nmap <leader>gf :!gofmt -w %<cr>

" Python formatter
nmap <leader>pf :!black %<cr>

" Web formatter
nmap <leader>wf :!prettier % -w<cr>

" Plugins
lua << EOF
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "nvim-lua/plenary.nvim",
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end
  },
  {
    "neovim/nvim-lspconfig"
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip"
      },
      {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets"
      }
    }
  },
  {
    "rust-lang/rust.vim",
    ft = { "rust" }
  },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    config = function()
      require("rust-tools").setup()
    end
  },
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy"
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
    "romgrk/barbar.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  {
    "yassinebridi/vim-purpura",
    lazy = false,
    priority = 1000
  },
  {
    "igorgue/danger",
    lazy = false,
    priority = 1000
  },
  {
    "f-person/auto-dark-mode.nvim",
    event = "VeryLazy"
  },
  {
    "neoclide/coc.nvim",
    branch = "release"
  },
  {
    "tribela/vim-transparent",
    lazy = false,
    priority = 1000
  },
  {
    "gen740/SmoothCursor.nvim"
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
    "goolord/alpha-nvim"
  },
  {
    {
      "junegunn/fzf", 
      build = "./install --bin"
    },
    "junegunn/fzf.vim"
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-treesitter/nvim-treesitter"
    }
  },
  {
    "Pocco81/auto-save.nvim",
    event = { "InsertEnter", "VeryLazy" }
  },
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter", "VeryLazy" }
  },
  {
    "jose-elias-alvarez/null-ls.nvim"
  },
  {
    "ray-x/lsp_signature.nvim",
    event = { "InsertEnter", "VeryLazy" }
  },
})
EOF

" Moving string
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" coc plug
let g:coc_global_extensions=[
    \'coc-json',
    \'coc-tsserver',
    \'coc-rust-analyzer',
    \'coc-css',
    \'coc-html',
    \'coc-xml',
    \'coc-yaml',
    \'coc-toml',
    \'coc-clangd',
    \'coc-pyright',
    \'coc-go',
    \'coc-snippets',
    \]

" Coc-config
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Remap <C-down> and <C-up> to scroll float windows/popups
nnoremap <silent><nowait><expr> <C-down> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-up> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-down> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-up> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-down> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-up> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

lua << EOF
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'
local async = require "plenary.async"

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  completion = {
    autocomplete = false
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<up>'] = cmp.mapping.select_prev_item(),
    ['<down>'] = cmp.mapping.select_next_item(),
    ['<C-up>'] = cmp.mapping.scroll_docs(-4),
    ['<C-down>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<esc>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  --buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  require "lsp_signature".on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      floating_window = true,
      floating_window_above_cur_line = true,
      --floating_window_off_x = 20,
      doc_lines = 10,
      hint_prefix = '👻 '
    }, bufnr)  -- Note: add in lsp client on-attach
end

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,
    },
    on_attach = on_attach
})

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--local servers = {'rust_analyzer' }
local servers = { 'pyright', 'rust_analyzer', 'gopls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

" Telescope fzf plugin
autocmd! FileType TelescopeResults setlocal nofoldenable
lua << EOF
local present, telescope = pcall(require, "telescope")

if not present then
  return
end

vim.g.theme_switcher_loaded = true

local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },
  extensions_list = { "fzf" },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

telescope.setup(options)
for _, ext in ipairs(options.extensions_list) do
  telescope.load_extension(ext)
end
EOF

" SmoothCursor
lua << EOF
require('smoothcursor').setup({
    autostart = true,
    cursor = "👻",              -- cursor shape (need nerd font)
    texthl = "SmoothCursor",   -- highlight group, default is { bg = nil, fg = "#FFD400" }
    linehl = nil,              -- highlight sub-cursor line like 'cursorline', "CursorLine" recommended
    type = "default",          -- define cursor movement calculate function, "default" or "exp" (exponential).
    fancy = {
        enable = true,        -- enable fancy mode
        head = { cursor = "🌟", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "👻", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "🐢", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "🐸", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "🐨", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "🦀", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "🐼", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "⭐", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "🧬️", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "🦝", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "🦊", texthl = "SmoothCursor", linehl = nil },
        body = {
            { cursor = "" },
            { cursor = "" },
            { cursor = "●" },
            { cursor = "●" },
            { cursor = "•" },
            { cursor = "." },
            { cursor = "." },
        },
        tail = { cursor = nil, texthl = "SmoothCursor" }
    },
    flyin_effect = nil,        -- "bottom" or "top"
    speed = 25,                -- max is 100 to stick to your current position
    intervals = 35,            -- tick interval
    priority = 10,             -- set marker priority
    timeout = 3000,            -- timout for animation
    threshold = 3,             -- animate if threshold lines jump
    disable_float_win = false, -- disable on float window
    enabled_filetypes = nil,   -- example: { "lua", "vim" }
    disabled_filetypes = nil,  -- this option will be skipped if enabled_filetypes is set. example: { "TelescopePrompt", "NvimTree" }
})

local autocmd = vim.api.nvim_create_autocmd

autocmd({ 'ModeChanged' }, {
  callback = function()
    local current_mode = vim.fn.mode()
    if current_mode == 'n' then
      vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#8aa872' })
      vim.fn.sign_define('smoothcursor', { text = "👻" })
    elseif current_mode == 'v' then
      vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#ffffff' })
      vim.fn.sign_define('smoothcursor', { text = "" })
    elseif current_mode == 'V' then
      vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#ffffff' })
      vim.fn.sign_define('smoothcursor', { text = "" })
    elseif current_mode == 's' then
      vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#ffffff' })
      vim.fn.sign_define('smoothcursor', { text = "" })
    elseif current_mode == 'i' then
      vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#FFF6A1' })
      vim.fn.sign_define('smoothcursor', { text = "" })
    end
  end,
})
EOF

" NvimTree setup
lua << EOF
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local options = {
  filters = {
    dotfiles = true,
  },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    adaptive_size = false,
    side = "left",
    width = 30,
    preserve_window_proportions = true,
  },
  git = {
    enable = true,
    ignore = false,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
      quit_on_open = true,
    },
  },
  renderer = {
    --root_folder_modifier = ":t",
    highlight_git = true,
    highlight_opened_files = "none",

    indent_markers = {
      enable = true,
    },

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },

      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          default = "󰉋",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "󰀘",
        },
      },
    },
  },
}

require("nvim-tree").setup(options)
EOF

" Treesitter config
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  indent = { enable = true },
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "go",
    "javascript",
    "json",
    "python",
    "toml",
    "typescript",
    "vim",
    "lua",
    "yaml",
  }
}
EOF

" Bufferline config
lua << EOF
vim.g.barbar_auto_setup = false -- disable auto-setup
require'barbar'.setup {
  icons = {
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ '},
      [vim.diagnostic.severity.WARN] = {enabled = true},
      [vim.diagnostic.severity.INFO] = {enabled = false},
      [vim.diagnostic.severity.HINT] = {enabled = false},
    },
    modified = {button = '●'},
    pinned = {button = '車', filename = true, separator = {right = ''}},
  },
  insert_at_end = true,
  auto_hide = true,
}
EOF

" Statusline config
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    section_separators = { left = ' 🐨', right = '' },
    component_separators = { left = '', right = '' },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
    disabled_filetypes = { "alpha", "NvimTree" },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch',
      {'diff', symbols = { added = ' ', modified = ' 柳', removed = '  ' },
        diff_color = {
          added = { fg = '#20fc03' },
          modified = { fg = '#ffffff' },
          removed = { fg = '#00ffff' },
        },
      },
      {'diagnostics', sources = { 'nvim_diagnostic' },
        symbols = { error = '(╯°□°)╯  ', warn = ' ', info = ' ' },
        diagnostics_color = {
          color_error = { fg = '#ff0000' },
          color_warn = { fg = '#ff9900' },
          color_info = { fg = '#adadad' },
        },
      }
    },
    lualine_c = {{'filename', color = { gui = 'bold' }}, 'filesize'},
    lualine_x = {'filetype', 'encoding', 'fileformat'},
    lualine_y = {'%l,%c/%L'},
    lualine_z = {{'progress', separator = { left = '🐸 ' }}}
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
  winbar = { lualine_c = {{"filename", path = 2, color = { gui = 'bold' }}}, },
  inactive_winbar = {},
  extensions = {}
}
EOF

" Startup Screen
lua << EOF
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
 return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
     [[------------------------------------------------------]],
     [[| ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⠿⠿⠛⠛⠋⢉⠉⠉⠉⠉⠉⠉⠉⠉⠙⠛⠛⠛⠿⢿⣷⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀ |]],
     [[| ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⡶⠟⠋⠉⠀⠀⠀⠀⢰⣾⣂⠄⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠈⠀⠀⠀⠉⠛⠿⣶⣤⡀⠀⠀⠀⠀ |]],
     [[| ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡾⠛⠉⠀⠀⠀⠄⠂⠀⢀⣶⡿⠛⢿⡿⠀⠀⠀⠈⠰⠁⡀⣤⣽⣶⡄⠂⠀⢀⠀⠀⠀⠀⠉⠛⢶⣄⠀⠀ |]],
     [[| ⠀⠀⠀⠀⠀⠀⠀⢀⣴⠿⠋⠐⢀⠂⠐⠀⢈⠰⢀⢢⣿⠏⠀⠀⣼⡇⡃⠄⠂⠐⠠⢢⣿⠏⠀⠙⣿⠀⠀⠀⡀⠂⠀⠄⠀⠀⠀⠘⠻⣦ |]],
     [[| ⠀⠀⠀⠀⠀⢀⣴⠿⠃⠐⠀⠈⠂⠀⠠⠁⠀⠢⢰⣿⡏⠀⠀⢠⣿⠃⠁⠄⠂⠱⣰⣿⠇⠀⠀⢰⣿⡇⠀⠀⠀⠀⠀⠄⠁⠀⠁⠠⠁⠈ |]],
     [[| ⠀⠀⠀⡀⣤⣿⠋⠠⠐⠀⡀⠂⠈⠀⠠⠀⢀⢡⣿⣿⣇⣀⣴⣿⡏⠀⢀⠂⠄⣧⣿⣿⠀⠀⢀⣾⣿⠁⠀⠀⡀⠂⠀⠠⠀⠂⠀⠀⠀⠀ |]],
     [[| ⠀⠀⢈⣼⡟⠁⠠⠁⠂⠀⠀⠐⠀⡁⠠⠂⡀⣾⣿⣿⣿⣿⣿⡟⣰⠀⠂⠀⢰⣻⣿⣷⣦⣤⣾⣿⡏⠀⠀⢀⠀⠀⡐⠀⠠⠐⠀⡀⠀⠀ |]],
     [[| ⣠⣄⣾⠃⡀⠀⠐⠀⢀⢠⣀⢄⡀⠀⠁⠀⢀⣿⣿⣿⣿⣿⡟⠀⠀⠀⠐⠀⡁⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠂⠀⠀⠄⠀⠄⠀⠀⠀ |]],
     [[| ⣿⣿⠃⠀⡀⠁⠈⠐⣬⢷⡹⢮⡝⣆⠀⠀⠀⣿⣿⣿⣿⠏⠀⠀⠀⠁⠀⠀⡡⣿⣿⣿⣿⣿⣿⠃⠀⠈⠠⠐⠀⠠⠀⠂⠀⠠⠀⠀⠀⠀ |]],
     [[| ⣾⣧⠀⠀⠐⠀⠀⠀⠈⠫⠝⠧⠛⠀⠀⠀⠀⠹⠿⠟⠁⡀⢤⣤⣤⣀⠠⠀⠑⢻⣿⣿⣿⡿⠁⠀⠀⠐⠀⡀⢀⡀⢀⠀⠀⠁⠠⠀⠀⠀ |]],
     [[| ⣿⡇⠀⠀⠀⠄⠂⠄⠀⡀⠀⠀⠠⠐⠀⡄⠀⠀⠀⠀⠀⠀⣺⣿⣿⣿⣷⠆⠀⠈⠛⠿⠋⠀⠀⢀⠀⢂⡷⣹⢧⣛⢧⣖⡠⠀⠀⢀⠀⠀ |]],
     [[| ⡏⠁⠠⠀⢀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⣹⣿⡿⢻⡏⠀⠀⠀⠀⠀⠀⠀⠄⢀⠀⠹⢜⡳⢮⡝⣾⢸⠓⡀⠁⠀⠀⠀ |]],
     [[| ⠃⠀⠐⠀⡀⣦⣬⣤⣤⣴⣄⣂⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⢼⣏⢻⡿⠃⠀⠀⠉⠀⠀⠀⠀⠄⠀⠀⠀⠀⠉⠂⠙⠀⠁⡀⠀⠀⠁⠀⠀ |]],
     [[| ⠀⠀⢀⣂⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣾⣿⣿⣧⣤⣤⣤⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⢁⠀⠄⠀⠀⠀⠀ |]],
     [[| ⠀⠀⠉⠉⠉⠻⣿⣿⣳⣯⢿⣽⣻⡽⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣤⠀⠀⠀⡀⠀⠂⠀⠀⠀ |]],
     [[| ⠀⠀⠠⢀⠀⠀⠈⢿⣿⡾⣯⡷⣿⣽⣻⣾⡟⠁⢹⣿⡿⠻⢿⣿⣳⣯⢿⡽⣯⣟⣿⣻⣟⡿⣿⢿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠁⠀⠀ |]],
     [[| ⠀⠀⢀⠀⠠⠀⠀⠈⢿⣿⣷⣻⣷⣿⣿⣿⡇⠀⢸⣿⣷⣄⣰⣿⣿⡽⣯⣟⣷⣻⣞⡷⣯⣿⣿⠟⠋⠉⠉⠉⠉⠉⠙⠓⠤⣄⡀⠀⠀⠀ |]],
     [[| ⠀⠀⠀⡀⠄⠀⠀⠀⢹⣿⣿⠋⠁⣠⣀⡀⠀⠀⣿⣿⠋⠉⣿⣿⣿⠿⠟⠛⠿⢿⣾⣿⣿⠟⠁⠀⠀⡀⠐⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀ |]],
     [[| ⠀⠀⠀⢀⠀⠀⠡⠀⢿⣿⡏⠀⣸⣿⣿⣷⠀⢠⣿⣿⠀⠀⣿⡿⠁⢀⣤⡤⠀⠀⢿⣿⠏⠀⠀⠀⠂⠀⠀⠀⠂⠀⠁⡀⢀⠀⠐⠀⠀⠀ |]],
     [[| ⠀⠀⠄⠀⠠⠁⢀⢩⣾⣿⣇⠀⠹⢿⣿⠿⠀⢸⣿⡗⠀⢰⣿⡃⠀⠀⠀⣀⣤⣶⣿⣿⠀⠀⠂⠐⠀⠀⡀⠂⠀⡀⠁⠀⠀⠀⠈⠀⠀⠀ |]],
     [[| ⡀⢀⠀⠁⢠⡐⣮⣾⣿⡿⣿⣷⣄⣈⣉⣀⣀⣸⣿⣇⠀⢸⣿⣧⡀⠈⠛⠿⠟⠉⢿⣿⡆⠀⠀⠁⠀⠀⠀⡀⢀⠀⠄⠁⡀⠈⠀⢁⠀⠀ |]],
     [[| ⣼⡢⢎⣷⣣⣾⣿⣿⣯⣟⣷⣻⣿⣿⣿⣿⣿⢿⣿⣿⣿⡿⣟⣿⣿⣶⣦⣴⣴⣶⣿⣿⣿⡠⢀⠈⠀⠐⠀⠀⠀⠠⠀⢂⠀⠄⠁⢂⠀⣀ |]],
     [[| ⣿⣿⣿⣿⢟⠫⣍⢛⡹⢛⡛⡟⠿⠿⠿⡿⣿⣿⣿⣿⣷⣿⣯⣷⣯⣿⣽⣻⣟⣿⣻⣟⣿⣷⡍⡖⢤⣈⠐⡈⠠⢁⠂⠄⢠⢀⣂⢦⢳⠰ |]],
     [[| ⣿⢯⡿⣿⣯⡖⣡⠏⣔⠫⠴⡙⡬⢃⡳⣘⡔⠲⡤⡩⢍⡍⢏⡛⣛⢛⠻⠟⡿⢿⣿⣿⣾⣿⣿⣜⠦⣌⠳⢥⡓⢮⡜⣎⠳⡜⣬⢳⢣⡙ |]],
     [[| ⣿⢯⣟⡿⣿⣿⣇⣞⣌⢣⠏⣜⡡⢏⠴⣡⠚⡥⢣⡱⢣⠜⣪⠱⡌⡎⣝⢪⢱⣒⢦⣲⠱⣬⢽⡻⢿⣮⣝⢦⡙⢣⡚⢬⢓⣙⢒⡫⢆⡹ |]],
     [[------------------------------------------------------]],
}

dashboard.section.buttons.val = {
   dashboard.button("f", "󰈚  Find File", ":Telescope find_files <CR>"),
   dashboard.button("e", "󰉋  File Explorer", ":NvimTreeToggle <CR>"),
   dashboard.button("t", "󰚩  Find Text", ":Telescope live_grep <CR>"),
   dashboard.button("o", "  Recent files", ":Telescope oldfiles <CR>"),
   dashboard.button("q", "  Quit", ":qa<CR>"),
}

local function footer()
 return "Don't Stop Until You are Proud..."
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
EOF

" Transparent
let g:transparent_enabled = v:true

" Switch colorschemes
lua << EOF
require("auto-dark-mode").setup({
  update_interval = 1000,

  -- Light colorscheme
  set_light_mode = function()
    vim.cmd("colorscheme purpura")

    -- Colors for messages in code
    vim.api.nvim_set_hl(0, "DiagnosticError", {
      fg = "#e100ff",
      bold = true
    })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
      cterm = { undercurl = true },
      undercurl = true,
      fg = "#ff21a2",
      sp = "#fc0394"
    })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
      cterm = { undercurl = true },
      undercurl = true
    })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {
      cterm = { undercurl = true },
      undercurl = true
    })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {
      cterm = { undercurl = true },
      undercurl = true
    })

    -- Line Numbers
    vim.api.nvim_set_hl(0, "LineNr", {
      fg = "#aa7dff" 
    })

    -- Lualine change
    require('lualine').setup({
      sections = {
        lualine_b = {'branch',
          {'diff', symbols = { added = ' ', modified = ' 柳', removed = '  ' },
            diff_color = {
              added = { fg = '#00ff90' },
              modified = { fg = '#ffffff' },
              removed = { fg = '#ff7de5' }
            },
          },
          {'diagnostics', sources = { 'nvim_diagnostic' },
            symbols = { error = '(╯°□°)╯  ', warn = ' ', info = ' ' }
          }
        }
      }
    })

    -- Cursor
    require('smoothcursor').setup({
      local autocmd = vim.api.nvim_create_autocmd

      autocmd({ 'ModeChanged' }, {
        callback = function()
          local current_mode = vim.fn.mode()
          if current_mode == 'n' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#8aa872' })
            vim.fn.sign_define('smoothcursor', { text = "👻" })
          elseif current_mode == 'v' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#ffffff' })
            vim.fn.sign_define('smoothcursor', { text = "" })
          elseif current_mode == 'V' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#ffffff' })
            vim.fn.sign_define('smoothcursor', { text = "" })
          elseif current_mode == 's' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#ffffff' })
            vim.fn.sign_define('smoothcursor', { text = "" })
          elseif current_mode == 'i' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#fff6a1' })
            vim.fn.sign_define('smoothcursor', { text = "" })
          elseif current_mode == 'R' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#b5cea8' })
            vim.fn.sign_define('smoothcursor', { text = "" })
          end
        end,
      })
    })
  end,

  -- Dark colorscheme
  set_dark_mode = function()
    vim.cmd("colorscheme danger_candy")

    -- Colors for messages in code
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {
      cterm = { undercurl = true },
      undercurl = true,
      sp = "#61afef"
    })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {
      cterm = { undercurl = true },
      undercurl = true,
      sp = "#c8a2f7"
    })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
      cterm = { undercurl = true },
      undercurl = true,
      sp = "#f1fa8c"
    })
    vim.api.nvim_set_hl(0, "DiagnosticError", {
      fg = "#cbe6ff",
      bold = true
    })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
      cterm = { undercurl = true },
      undercurl = true,
      fg = "#ff21a2",
      sp = "#fc0394"
    })

    -- Line Numbers
    vim.api.nvim_set_hl(0, "LineNr", {
      fg = "#cbe6ff"
    })

    -- NvimTree
    vim.api.nvim_set_hl(0, "NvimTreeRootFolder", {
      fg = "#cbe6ff"
    })

    -- Telescope
    vim.api.nvim_set_hl(0, "TelescopePromptCounter", {
      fg = "#875fff"
    })

    -- Buffers
    vim.api.nvim_set_hl(0, "BufferDefaultInactive", {
      bg = "#262b4c"
    })
    vim.api.nvim_set_hl(0, "BufferDefaultCurrent", {
      fg = "#ffffd7"
    })
    vim.api.nvim_set_hl(0, "BufferDefaultVisible", {
      fg = "#875fff"
    })

    -- Lualine change
    require('lualine').setup({
      sections = {
        lualine_b = {'branch',
          {'diff', symbols = { added = ' ', modified = ' 柳', removed = '  ' }},
          {'diagnostics', sources = { 'nvim_diagnostic' },
            symbols = { error = '(╯°□°)╯  ', warn = ' ', info = ' ' }
          }
        }
      }
    })

    -- Cursor
    require('smoothcursor').setup({
      local autocmd = vim.api.nvim_create_autocmd

      autocmd({ 'ModeChanged' }, {
        callback = function()
          local current_mode = vim.fn.mode()
          if current_mode == 'n' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#8aa872' })
            vim.fn.sign_define('smoothcursor', { text = "👻" })
          elseif current_mode == 'v' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#8080ac' })
            vim.fn.sign_define('smoothcursor', { text = "" })
          elseif current_mode == 'V' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#8080ac' })
            vim.fn.sign_define('smoothcursor', { text = "" })
          elseif current_mode == 's' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#8080ac' })
            vim.fn.sign_define('smoothcursor', { text = "" })
          elseif current_mode == 'i' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#cbe6ff' })
            vim.fn.sign_define('smoothcursor', { text = "" })
          elseif current_mode == 'R' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#ffd75f' })
            vim.fn.sign_define('smoothcursor', { text = "" })
          end
        end,
      })
    })
  end
})
EOF
