-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/guozihan/.cache/nvim/packer_hererocks/2.1.1774638290/share/lua/5.1/?.lua;/home/guozihan/.cache/nvim/packer_hererocks/2.1.1774638290/share/lua/5.1/?/init.lua;/home/guozihan/.cache/nvim/packer_hererocks/2.1.1774638290/lib/luarocks/rocks-5.1/?.lua;/home/guozihan/.cache/nvim/packer_hererocks/2.1.1774638290/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/guozihan/.cache/nvim/packer_hererocks/2.1.1774638290/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27archvim/config/luasnip\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/L3MON4D3/LuaSnip"
  },
  ["aerial.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26archvim/config/aerial\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/stevearc/aerial.nvim"
  },
  ["bufdelete.nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/bufdelete.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/famiu/bufdelete.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30archvim/config/bufferline\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/akinsho/bufferline.nvim"
  },
  catppuccin = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30archvim/config/catppuccin\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/catppuccin/nvim"
  },
  ["cmake-tools.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31archvim/config/cmake-tools\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/cmake-tools.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/Civitasv/cmake-tools.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/hrsh7th/cmp-cmdline"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/cmp-emoji",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/hrsh7th/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/hrsh7th/cmp-path"
  },
  ["cmp-rg"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/cmp-rg",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/lukas-reineke/cmp-rg"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/f3fora/cmp-spell"
  },
  ["cmp-under-comparator"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/cmp-under-comparator",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/lukas-reineke/cmp-under-comparator"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/saadparwaiz1/cmp_luasnip"
  },
  ["diagflow.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/diagflow\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/diagflow.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/dgagn/diagflow.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/sindrets/diffview.nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/stevearc/dressing.nvim"
  },
  ["fcitx.nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/fcitx.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/h-hg/fcitx.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/rafamadriz/friendly-snippets"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/ibhagwan/fzf-lua"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/gitsigns\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/lewis6991/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/ellisonleao/gruvbox.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23archvim/config/hop\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/phaazon/hop.nvim"
  },
  ["image.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30archvim/config/image-nvim\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/image.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/3rd/image.nvim"
  },
  ["inc-rename.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15inc_rename\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/inc-rename.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/smjonas/inc-rename.nvim"
  },
  ["local-highlight.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0#archvim/config/local-highlight\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/local-highlight.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/tzachar/local-highlight.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0!archvim/config/lsp-signature\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    cond = { "\27LJ\2\n>\0\0\3\0\3\0\0056\0\0\0'\2\1\0B\0\2\0029\0\2\0L\0\2\0\15nerd_fonts\20archvim.options\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/opt/lspkind-nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/onsails/lspkind-nvim"
  },
  ["lualine-time"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/lualine-time",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/archibate/lualine-time"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27archvim/config/lualine\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/nvim-lualine/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/rktjmp/lush.nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0-let g:mkdp_browser = '/usr/bin/chromium'\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/williamboman/mason-lspconfig.nvim"
  },
  ["mason-registry"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/mason-registry",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/mason-org/mason-registry"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25archvim/config/mason\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/williamboman/mason.nvim"
  },
  ["mathjax-support-for-mkdp"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/mathjax-support-for-mkdp",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/iamcco/mathjax-support-for-mkdp"
  },
  neoformat = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29archvim/config/neoformat\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/sbdchd/neoformat"
  },
  neogit = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/neogit",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/NeogitOrg/neogit"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/shaunsingh/nord.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/nvim-cmp\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/hrsh7th/nvim-cmp"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 archvim/config/nvim-comment\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/terrortylor/nvim-comment"
  },
  ["nvim-lastplace"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-lastplace\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/nvim-lastplace",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/ethanholz/nvim-lastplace"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29archvim/config/lspconfig\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/neovim/nvim-lspconfig"
  },
  ["nvim-mcp"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/nvim-mcp\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/nvim-mcp",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/linw1995/nvim-mcp"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26archvim/config/notify\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/rcarriga/nvim-notify"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n<\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0!archvim/config/nvim-surround\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/kylechui/nvim-surround"
  },
  ["nvim-toggler"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 archvim/config/nvim-toggler\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/nvim-toggler",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/nguyenvukhang/nvim-toggler"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29archvim/config/nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treehopper"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/nvim-treehopper",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/mfussenegger/nvim-treehopper"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30archvim/config/treesitter\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    cond = { "\27LJ\2\n>\0\0\3\0\3\0\0056\0\0\0'\2\1\0B\0\2\0029\0\2\0L\0\2\0\15nerd_fonts\20archvim.options\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/nvim-tree/nvim-web-devicons"
  },
  ["opencode.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/opencode\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/opencode.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/NickvanDyke/opencode.nvim"
  },
  ouroboros = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/ouroboros",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/jakemason/ouroboros"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/wbthomason/packer.nvim"
  },
  ["pastify.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 archvim/config/pastify-nvim\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/pastify.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/TobinPalmer/pastify.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/nvim-lua/popup.nvim"
  },
  ripgrep = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/ripgrep",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/BurntSushi/ripgrep"
  },
  ["scope.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\nscope\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/scope.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/tiagovla/scope.nvim"
  },
  ["snacks.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26archvim/config/snacks\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/snacks.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/folke/snacks.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/tami5/sqlite.lua"
  },
  ["stickybuf.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stickybuf\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/stickybuf.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/stevearc/stickybuf.nvim"
  },
  ["telescope-changes.nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/telescope-changes.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/LinArcX/telescope-changes.nvim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/telescope-github.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/nvim-telescope/telescope-github.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29archvim/config/telescope\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/nvim-telescope/telescope.nvim"
  },
  ["tmux.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24archvim/config/tmux\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/tmux.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/aserowy/tmux.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30archvim/config/toggleterm\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27archvim/config/trouble\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/twilight\frequire\0" },
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/folke/twilight.nvim"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/andymass/vim-matchup"
  },
  ["vim-pio"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/vim-pio",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/normen/vim-pio"
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/folke/zen-mode.nvim"
  },
  ["zephyr-nvim"] = {
    loaded = true,
    path = "/home/guozihan/.local/share/nvim/site/pack/packer/start/zephyr-nvim",
    url = "/home/guozihan/.config/nvim/lua/archvim/predownload/glepnir/zephyr-nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Config for: image.nvim
time([[Config for image.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30archvim/config/image-nvim\frequire\0", "config", "image.nvim")
time([[Config for image.nvim]], false)
-- Config for: nvim-toggler
time([[Config for nvim-toggler]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 archvim/config/nvim-toggler\frequire\0", "config", "nvim-toggler")
time([[Config for nvim-toggler]], false)
-- Config for: pastify.nvim
time([[Config for pastify.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 archvim/config/pastify-nvim\frequire\0", "config", "pastify.nvim")
time([[Config for pastify.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26archvim/config/notify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: neoformat
time([[Config for neoformat]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29archvim/config/neoformat\frequire\0", "config", "neoformat")
time([[Config for neoformat]], false)
-- Config for: snacks.nvim
time([[Config for snacks.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26archvim/config/snacks\frequire\0", "config", "snacks.nvim")
time([[Config for snacks.nvim]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 archvim/config/nvim-comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: inc-rename.nvim
time([[Config for inc-rename.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15inc_rename\frequire\0", "config", "inc-rename.nvim")
time([[Config for inc-rename.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/nvim-cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: stickybuf.nvim
time([[Config for stickybuf.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stickybuf\frequire\0", "config", "stickybuf.nvim")
time([[Config for stickybuf.nvim]], false)
-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26archvim/config/aerial\frequire\0", "config", "aerial.nvim")
time([[Config for aerial.nvim]], false)
-- Config for: local-highlight.nvim
time([[Config for local-highlight.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0#archvim/config/local-highlight\frequire\0", "config", "local-highlight.nvim")
time([[Config for local-highlight.nvim]], false)
-- Config for: scope.nvim
time([[Config for scope.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\nscope\frequire\0", "config", "scope.nvim")
time([[Config for scope.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29archvim/config/nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27archvim/config/luasnip\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25archvim/config/mason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: tmux.nvim
time([[Config for tmux.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24archvim/config/tmux\frequire\0", "config", "tmux.nvim")
time([[Config for tmux.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30archvim/config/toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: cmake-tools.nvim
time([[Config for cmake-tools.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31archvim/config/cmake-tools\frequire\0", "config", "cmake-tools.nvim")
time([[Config for cmake-tools.nvim]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0!archvim/config/lsp-signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: diagflow.nvim
time([[Config for diagflow.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/diagflow\frequire\0", "config", "diagflow.nvim")
time([[Config for diagflow.nvim]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23archvim/config/hop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27archvim/config/trouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: opencode.nvim
time([[Config for opencode.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/opencode\frequire\0", "config", "opencode.nvim")
time([[Config for opencode.nvim]], false)
-- Config for: nvim-lastplace
time([[Config for nvim-lastplace]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-lastplace\frequire\0", "config", "nvim-lastplace")
time([[Config for nvim-lastplace]], false)
-- Config for: nvim-mcp
time([[Config for nvim-mcp]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/nvim-mcp\frequire\0", "config", "nvim-mcp")
time([[Config for nvim-mcp]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27archvim/config/lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30archvim/config/bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30archvim/config/catppuccin\frequire\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28archvim/config/twilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29archvim/config/lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30archvim/config/treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0!archvim/config/nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29archvim/config/telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Conditional loads
time([[Conditional loading of nvim-web-devicons]], true)
  require("packer.load")({"nvim-web-devicons"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-web-devicons]], false)
time([[Conditional loading of lspkind-nvim]], true)
  require("packer.load")({"lspkind-nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of lspkind-nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
