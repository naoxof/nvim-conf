-- personal setting
vim.g.mapleader = " "

-- plugin
local jetpackfile = vim.fn.stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
local jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if vim.fn.filereadable(jetpackfile) == 0 then
  vim.fn.system(string.format('curl -fsSLo %s --create-dirs %s', jetpackfile, jetpackurl))
end

vim.cmd('packadd vim-jetpack')

require('jetpack.packer').startup(function(use)
  use 'tani/vim-jetpack'
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  use { 'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use 'neovim/nvim-lspconfig'
  use {'williamboman/mason.nvim', ['do'] = ':MasonUpdate' }
  use 'williamboman/mason-lspconfig.nvim'
end)

-- hop setting
-- TODO

if vim.o.compatible then
  vim.o.compatible = false -- Be iMproved
end

--マウスを有効
vim.o.mouse = 'a'
--文字コードをUFT-8に設定
vim.o.fileencoding = 'utf-8'
-- バックアップファイルを作らない
vim.o.backup = false
-- スワップファイルを作らない
vim.o.swapfile = false
-- 編集中のファイルが変更されたら自動で読み直す
vim.o.autoread = true
-- バッファが編集中でもその他のファイルを開けるように
vim.o.hidden = true
-- 入力中のコマンドをステータスに表示する
vim.o.showcmd = true
-- 行番号を表示
vim.wo.number = true
-- ビープ音を可視化
vim.o.visualbell = true
-- 括弧入力時の対応する括弧を表示
vim.o.showmatch = true
-- ステータスラインを常に表示
vim.o.laststatus = 2
-- コマンドラインの補完
vim.o.wildmode = 'list:longest'
-- 行末の1文字先までカーソルを移動できるように
vim.o.virtualedit = 'onemore'
-- シンタックスハイライトの有効化
vim.cmd [[syntax enable]]
-- Tab文字を半角スペースにする
vim.o.expandtab = true
-- 行頭以外のTab文字の表示幅（スペースいくつ分）
vim.o.tabstop = 2
-- 行頭でのTab文字の表示幅
vim.o.shiftwidth = 2
