M = {}

-- deprecated, around for compatability for now.
M.jump_mode = "invoking"
-- remap the arrow keys to resize any litee.nvim windows.
M.map_resize_keys = false
-- do not map any keys inside any gh.nvim buffers.
M.disable_keymaps = false
-- the icon set to use.
M.icon_set = "default"
-- any custom icons to use.
M.icon_set_custom = nil
-- whether to register the @username and #issue_number omnifunc completion
-- in buffers which start with .git/
M.git_buffer_completion = true

-- defines keymaps in gh.nvim buffers.
M.keymaps = {}
-- when inside a gh.nvim panel, this key will open a node if it has
-- any futher functionality. for example, hitting <CR> on a commit node
-- will open the commit's changed files in a new gh.nvim panel.
M.keymaps.open = "<CR>"
-- when inside a gh.nvim panel, expand a collapsed node
M.keymaps.expand = "zo"
-- when inside a gh.nvim panel, collpased and expanded node
M.keymaps.collapse = "zc"
-- when cursor is over a "#1234" formatted issue or PR, open its details
-- and comments in a new tab.
M.keymaps.goto_issue = "gd"
-- show any details about a node, typically, this reveals commit messages
-- and submitted review bodys.
M.keymaps.details = "d"
-- inside a convo buffer, submit a comment
M.keymaps.submit_comment = "<C-s>"
-- inside a convo buffer, when your cursor is ontop of a comment, open
-- up a set of actions that can be performed.
M.keymaps.actions = "<C-a>"
-- inside a thread convo buffer, resolve the thread.
M.keymaps.resolve_thread = "<C-r>"
-- inside a gh.nvim panel, if possible, open the node's web URL in your
-- browser. useful particularily for digging into external failed CI
-- checks.
M.keymaps.goto_web = "gx"

return M
