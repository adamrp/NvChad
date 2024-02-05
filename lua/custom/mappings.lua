local M = {}

M.disabled = {
  n = {
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    ["<leader>rh"] = "",
    ["<leader>ph"] = "",
    ["<leader>gb"] = "",
    ["<leader>td"] = "",
    -- Leaving this enabled even though there's also leader-# to comment stuff now
    -- I had a plan to use leader-/ for something else, but now I can't remember...
    -- ["<leader>/"] = "",
  },
}

M.telescope = {
  n = {
    ["<leader><C-r>"] = { "<cmd> Telescope command_history <CR>", "command history" },
    ["<leader>gb"] = { "<cmd> Telescope git_branches <CR>", "git branches" },
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>", "Toggle breakpoint"},
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpf"] = {
      function()
        require("dap-python").test_method()
      end,
      "Debug nearest function above cursor",
    },
    ["<leader>dpF"] = {
      function()
        require("dap-python").test_method({test_runner = "unittest_all"})
      end,
      "Debug all functions matching nearest above cursor",
    },
    ["<leader>dpc"] = {
      function()
        require("dap-python").test_class()
      end,
      "Debug nearest class above cursor",
    },
  },
}

M.dapui = {
  plugin = true,
  n = {
    ["<leader>dbu"] = {
      function()
        local dapui = require("dapui")
        dapui.toggle()
      end,
      "Toggle UI",
    },
  },
}

M.gitsigns = {
  plugin = true,
  v = {

    ["<leader>hs"] = {
      function()
        require("gitsigns").stage_hunk {vim.fn.line("."), vim.fn.line("v")}
      end,
      "Stage hunk (lines)",
    },

    ["<leader>hr"] = {
      function()
        require("gitsigns").reset_hunk {vim.fn.line("."), vim.fn.line("v")}
      end,
      "Reset hunk (lines)",
    },

  },
  n = {
    ["<leader>ghP"] = {
      function()
        require("gitsigns").preview_hunk_inline()
      end,
      "Preview hunk inline",
    },

    ["<leader>ghs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "Stage hunk",
    },

    ["<leader>ghr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },

    -- ["<leader>gha"] = {
    --   function()
    --     require("gitsigns").stage_buffer()
    --   end,
    --   "Stage buffer",
    -- },

    ["<leader>ghS"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      "Unstage hunk",
    },

    -- ["<leader>ghR"] = {
    --   function()
    --     require("gitsigns").reset_buffer()
    --   end,
    --   "Reset buffer",
    -- },

    ["<leader>ghp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },

    ["<leader>ghb"] = {
      function()
        require("gitsigns").blame_line{full=true}
      end,
      "Git blame line",
    },

    ["<leader>gtb"] = {
      function()
        require("gitsigns").toggle_current_line_blame()
      end,
      "Toggle current line blame",
    },

    -- ["<leader>ghd"] = {
    --   function()
    --     require("gitsigns").diffthis()
    --   end,
    --   "Diff this",
    -- },

    -- ["<leader>ghD"] = {
    --   function()
    --     require("gitsigns").diffthis("~")
    --   end,
    --   "Big diff this",
    -- },

    ["<leader>gtd"] = {
      function()
        require("gitsigns").toggle_delete()
      end,
      "Toggle delete",
    },

  }
}

M.persistence = {
  plugin = true,
  n = {
    ["<leader>qs"] = {
      function()
        require("persistence").load()
      end,
      "Load session",
    },
    ["<leader>ql"] = {
      function()
        require("persistence").load({ last = true })
      end,
      "Load last session",
    },
    ["<leader>qd"] = {
      function()
        require("persistence").stop()
      end,
      "Stop session recording",
    }
  }
}

M.harpoon = {
  plugin = true,
  n = {
    ["<leader>H"] = { "<cmd> Telescope harpoon marks <CR>", "Marks in telescope" },
    ["<A-a>"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Add file",
    },
    ["<A-n>"] = {
      function()
        require("harpoon.ui").nav_next()
      end,
      "Nav next file",
    },
    ["<A-p>"] = {
      function()
        require("harpoon.ui").nav_prev()
      end,
      "Nav prev file",
    },
    ["<A-j>"] = {
      function()
        require("harpoon.ui").nav_file(1)
      end,
      "Nav file 1",
    },
    ["<A-k>"] = {
      function()
        require("harpoon.ui").nav_file(2)
      end,
      "Nav file 2",
    },
    ["<A-l>"] = {
      function()
        require("harpoon.ui").nav_file(3)
      end,
      "Nav file 3",
    },
    ["<A-;>"] = {
      function()
        require("harpoon.ui").nav_file(4)
      end,
      "Nav file 4",
    },
    ["<A-'>"] = {
      function()
        require("harpoon.ui").nav_file(5)
      end,
      "Nav file 5",
    },
  }
}

M.gh = {
  plugin = true,
  n = {
    -- Commits
    ["<leader>ghcc"] = { "<cmd>GHCloseCommit<cr>", "Close" },
    ["<leader>ghce"] = { "<cmd>GHExpandCommit<cr>", "Expand" },
    ["<leader>ghco"] = { "<cmd>GHOpenToCommit<cr>", "Open To" },
    ["<leader>ghcp"] = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
    ["<leader>ghcz"] = { "<cmd>GHCollapseCommit<cr>", "Collapse" },

    -- Issues
    ["<leader>ghip"] = { "<cmd>GHPreviewIssue<cr>", "Preview" },

    -- Litee
    ["<leader>ghlt"] = { "<cmd>LTPanel<cr>", "Toggle Panel" },

    -- Review
    ["<leader>ghrb"] = { "<cmd>GHStartReview<cr>", "Begin" },
    ["<leader>ghrc"] = { "<cmd>GHCloseReview<cr>", "Close" },
    ["<leader>ghrd"] = { "<cmd>GHDeleteReview<cr>", "Delete" },
    ["<leader>ghre"] = { "<cmd>GHExpandReview<cr>", "Expand" },
    ["<leader>ghrs"] = { "<cmd>GHSubmitReview<cr>", "Submit" },
    ["<leader>ghrz"] = { "<cmd>GHCollapseReview<cr>", "Collapse" },

    -- Pull Request
    ["<leader>ghpc"] = { "<cmd>GHClosePR<cr>", "Close" },
    ["<leader>ghpd"] = { "<cmd>GHPRDetails<cr>", "Details" },
    ["<leader>ghpe"] = { "<cmd>GHExpandPR<cr>", "Expand" },
    ["<leader>ghpo"] = { "<cmd>GHOpenPR<cr>", "Open" },
    ["<leader>ghpp"] = { "<cmd>GHPopOutPR<cr>", "PopOut" },
    ["<leader>ghpr"] = { "<cmd>GHRefreshPR<cr>", "Refresh" },
    ["<leader>ghpt"] = { "<cmd>GHOpenToPR<cr>", "Open To" },
    ["<leader>ghpz"] = { "<cmd>GHCollapsePR<cr>", "Collapse" },

    -- Threads
    ["<leader>ghtc"] = { "<cmd>GHCreateThread<cr>", "Create" },
    ["<leader>ghtn"] = { "<cmd>GHNextThread<cr>", "Next" },
    ["<leader>ghtt"] = { "<cmd>GHToggleThread<cr>", "Toggle" },
  },
}

M.comment = {
  n = {
    ["<leader>#"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<leader>#"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

M.arp = {
  n = {
    ["<C-d>"] = {"M<C-d>zz", "Page down and center"},
    ["<C-u>"] = {"M<C-u>zz", "Page up and center"},
    ["J"] = {"mzJ`z", "Join next line & keep cursor in place"},
    ["n"] = {"nzzzv", "Go to next match and center"},
    ["N"] = {"Nzzzv", "Go to prev match and center"},
    ["<leader>G"] = {"<C-g>", "Show current file status line"},
    ["<leader>zz"] = {"<cmd> qa! <CR>", "Quit everything without checking"},
    ["<leader>."] = {"<C-z>", "Background (C-z) nvim"},

    ["<leader>sv"] = {"<C-w>v", "Split window vertically"},
    ["<leader>sh"] = {"<C-w>s", "Split window horizontally"},
    ["<leader>sx"] = {"<cmd> close <CR>", "Close current split window"},
    ["<leader>sm"] = {"<cmd> MaximizerToggle <CR>", "Toggle Pane Maximization"},

    ["<C-h>"] = {"<cmd> TmuxNavigateLeft <CR>", "Navigate window left"},
    ["<C-j>"] = {"<cmd> TmuxNavigateDown <CR>", "Navigate window down"},
    ["<C-k>"] = {"<cmd> TmuxNavigateUp <CR>", "Navigate window up"},
    ["<C-l>"] = {"<cmd> TmuxNavigateRight <CR>", "Navigate window right"},

    ["<leader>l"] = {"<cmd> set hlsearch! <CR>", "Toggle search highlighting"},

    ["<leader>d"] = {[["_d]], "Delete > black hole"},
    ["<leader>c"] = {[["_c]], "Change > black hole"},

    ["<leader>gd"] = {"<cmd> DiffviewOpen <CR>", "Diffview Open"},

    ["<leader>b"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>e"] = { "<cmd> enew <CR>", "New buffer" },

    ["gb"] = { "<cmd> GBrowse <CR>", "GBrowse" },

    ["]q"] = { "<cmd> cn <CR>", "Next quickfix" },
    ["]Q"] = { "<cmd> silent! cnewer <CR>", "Next quickfix list" },
    ["[q"] = { "<cmd> cN <CR>", "Prev quickfix" },
    ["[Q"] = { "<cmd> silent! colder <CR>", "Prev quickfix list" },
    ["<leader>q"] = {
      function()
        if vim.bo.filetype == "qf" then
          vim.api.nvim_command("ccl")
        else
          vim.api.nvim_command("ccl")
          vim.api.nvim_command("cw")
        end
      end,
      "Open/close quickfix window",
    },
  },
  v = {
    ["<C-j>"] = {":m '>+1<CR>gv=gv", "Move selection down"},
    ["<C-k>"] = {":m '<-2<CR>gv=gv", "Move selection up"},
    ["<leader>d"] = {[["_d]], "Delete > black hole"},
    ["<leader>c"] = {[["_c]], "Change > black hole"},
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["gb"] = { ":'<,'>GBrowse<CR>", "GBrowse" },
  },
}
return M
