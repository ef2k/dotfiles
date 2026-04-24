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

-- Disable netrw in favor of nvim-tree
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

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

-- Writing mode for prose files like Markdown.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.textwidth = 80
    vim.opt_local.formatoptions:append("t")
    vim.opt_local.spell = true
    vim.opt_local.colorcolumn = "80"
    vim.opt_local.relativenumber = false

    local opts = { buffer = true, silent = true }
    vim.keymap.set("n", "<leader>fp", "gqap", opts)
    vim.keymap.set("n", "<leader>F", "gggqG", opts)
    vim.keymap.set("x", "<leader>fp", "gq", opts)

    local ok, cmp = pcall(require, "cmp")
    if ok then
      cmp.setup.buffer({ enabled = false })
    end
  end,
})

-- Keymaps
local map = vim.keymap.set
map("n", "<CR>",           ":noh<CR><CR>")
map("n", "<leader><leader>", "<C-^>")
map("n", "<leader>w",      ":w<CR>")
map("n", "<leader>q",      ":q<CR>")
map("n", "<C-j>",          "<C-w>j")
map("n", "<C-k>",          "<C-w>k")
map("n", "<C-h>",          "<C-w>h")
map("n", "<C-l>",          "<C-w>l")
map("x", "<leader>y",      "\"+y")
map("n", "<leader>Y",      "gg\"+yG")

-- Plugins
require("lazy").setup({

  -- Colorscheme
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function() vim.cmd.colorscheme("tokyonight-night") end,
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    opts = { options = { theme = "tokyonight-night" } },
  },

  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    keys = { { "<leader>e", "<cmd>NvimTreeToggle<CR>" } },
    config = function()
      require("nvim-tree").setup()
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function(data)
          if vim.fn.isdirectory(data.file) == 1 then
            vim.cmd.cd(data.file)
            require("nvim-tree.api").tree.open()
          end
        end,
      })
    end,
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
    event = "BufReadPost",
    config = function()
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if not ok then return end
      configs.setup({
        ensure_installed = { "go", "javascript", "typescript", "lua", "html" },
        highlight = { enable = true },
        indent    = { enable = true },
      })
    end,
  },

  -- LSP server installer + native LSP (Neovim 0.11+)
  { "williamboman/mason.nvim", opts = {} },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config("*", { capabilities = capabilities })
      require("mason-lspconfig").setup({
        ensure_installed  = { "gopls", "ts_ls" },
        automatic_enable  = true,
      })
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
