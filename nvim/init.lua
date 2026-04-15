-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","

-- Options
local opt = vim.opt
opt.termguicolors  = true
opt.number         = true
opt.relativenumber = true
opt.numberwidth    = 3
opt.wrap           = false
opt.colorcolumn    = "80"
opt.tabstop        = 2
opt.shiftwidth     = 2
opt.shiftround     = true
opt.expandtab      = true
opt.splitbelow     = true
opt.splitright     = true
opt.backup         = false
opt.writebackup    = false
opt.swapfile       = false
opt.history        = 50
opt.incsearch      = true
opt.laststatus     = 2
opt.autowrite      = true
opt.cursorline     = false
opt.joinspaces     = false
opt.foldmethod     = "indent"
opt.foldnestmax    = 10
opt.foldenable     = false
opt.foldlevel      = 1
opt.completeopt    = { "menu", "menuone", "noselect" }

-- Keymaps
local map = vim.keymap.set
map("n", "<CR>",           ":noh<CR><CR>")
map("n", "<leader><leader>", "<C-^>")
map("n", "<leader>w",      ":w<CR>")
map("n", "<leader>q",      ":q<CR>")
map("n", ";",              ":")
map("n", ":",              ";")
map("n", "<C-j>",          "<C-w>j")
map("n", "<C-k>",          "<C-w>k")
map("n", "<C-h>",          "<C-w>h")
map("n", "<C-l>",          "<C-w>l")

-- Plugins
require("lazy").setup({

  -- Colorscheme
  {
    "cocopon/iceberg.vim",
    priority = 1000,
    config = function() vim.cmd.colorscheme("iceberg") end,
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    opts = { options = { theme = "iceberg_dark" } },
  },

  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    keys = { { "<leader>\\", "<cmd>NvimTreeToggle<CR>" } },
    opts = {},
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "<C-p>", "<cmd>Telescope find_files<CR>" } },
  },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "go", "javascript", "typescript", "lua", "html" },
        highlight = { enable = true },
        indent   = { enable = true },
      })
    end,
  },

  -- LSP server installer
  { "williamboman/mason.nvim", opts = {} },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = { ensure_installed = { "gopls", "ts_ls" } },
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig    = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      lspconfig.gopls.setup({ capabilities = capabilities })
      lspconfig.ts_ls.setup({ capabilities = capabilities })
    end,
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args) require("luasnip").lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
          ["<Tab>"]     = cmp.mapping.select_next_item(),
          ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
        },
      })
    end,
  },

  -- Git gutter signs
  { "lewis6991/gitsigns.nvim", opts = {} },

  -- Auto pairs
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

  -- Comments
  { "tpope/vim-commentary" },

  -- Surround
  { "tpope/vim-surround" },
})
