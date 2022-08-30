local options = {
  background = "dark",
  backspace = 'indent,eol,start',
  cmdheight =2,
--  colorcolumn = 120,
  encoding = 'utf-8',
  expandtab = true,
  filetype = 'on',
  formatoptions = 'tcqrn1',
  hlsearch = true,
  ignorecase = true,
  incsearch = true,
  laststatus = 2,
  modelines = 0,
  mouse = a,
--  nocompatible = true,
  number = true,
  scrolloff = 5,
  shiftround = false,
  shiftwidth = 2,
  showcmd = true,
  showmatch = true,
  showmode = true,
  showtabline = 2,
  signcolumn = 'yes',
  smartcase = true,
  softtabstop = 2,
  splitbelow = true,
  tabstop = 2,
  textwidth = 120,
  ttyfast = true,
  wrap = true,
}

vim.opt.matchpairs:append '<:>'

vim.cmd [[ set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')} ]]

for k, v in pairs(options) do
  vim.opt[k] = v
end
