local M = {}
M.arp = {
  n = {
    ["<C-d>"] = {"M<C-d>zz"},
    ["<C-u>"] = {"M<C-u>zz"},
    ["J"] = {"mzJ`z"},
    ["n"] = {"nzzzv"},
    ["N"] = {"Nzzzv"},
  },
  v = {
    ["<C-j>"] = {":m '>+1<CR>gv=gv"},
    ["<C-k>"] = {":m '<-2<CR>gv=gv"},
  },
}
return M
