-- vim-herdr-navigation — Neovim side (v5: nvim splits and herdr panes are one
-- flat space with wrap-around). At a split edge with no herdr neighbour in the
-- pressed direction, jump to the herdr pane at the FAR END (opposite edge):
-- Alt+Right at the right edge lands on the leftmost herdr pane, and vice versa.

local function herdr_neighbor(herdr, dir, pane_id)
  local out = vim.fn.system({ herdr, "pane", "neighbor", "--direction", dir, "--pane", pane_id })
  if vim.v.shell_error ~= 0 then
    return nil
  end
  local id = out:match('"neighbor_pane_id"%s*:%s*"([^"]+)"')
  return id
end

local function has_herdr_neighbor(herdr, dir, pane_id)
  local out = vim.fn.system({ herdr, "pane", "neighbor", "--direction", dir, "--pane", pane_id })
  return vim.v.shell_error == 0 and out:find("neighbor_pane_id") ~= nil
end

local opposite = { left = "right", right = "left", up = "down", down = "up" }

local function nav(wincmd, dir)
  local prev = vim.api.nvim_get_current_win()
  vim.cmd("wincmd " .. wincmd)
  if vim.api.nvim_get_current_win() ~= prev then
    return -- moved within Neovim
  end
  -- At a Neovim split edge.
  if vim.env.HERDR_PANE_ID and vim.env.HERDR_PANE_ID ~= "" then
    local herdr = vim.env.HERDR_BIN_PATH
    if herdr == nil or herdr == "" then
      herdr = "herdr"
    end
    if has_herdr_neighbor(herdr, dir, vim.env.HERDR_PANE_ID) then
      vim.fn.system({ herdr, "pane", "focus", "--direction", dir, "--pane", vim.env.HERDR_PANE_ID })
    else
      -- No neighbour that way: walk the opposite direction to the far end,
      -- then move focus there one hop at a time (herdr only focuses neighbours).
      local hop, hops = nil, 0
      repeat
        hop = herdr_neighbor(herdr, opposite[dir], hop or vim.env.HERDR_PANE_ID)
        if hop then
          hops = hops + 1
        end
      until hop == nil
      for _ = 1, hops do
        vim.fn.system({ herdr, "pane", "focus", "--direction", opposite[dir] })
      end
    end
    return
  elseif vim.env.HC_TERMINAL_ID and vim.env.HC_TERMINAL_ID ~= "" then
    vim.fn.system({ "herdr-app", "do", "pane.go", "--direction", dir })
    return
  elseif vim.env.TMUX and vim.env.TMUX ~= "" then
    local tmux = { left = "Left", down = "Down", up = "Up", right = "Right" }
    pcall(vim.cmd, "TmuxNavigate" .. tmux[dir])
    return
  end
  -- Not inside a multiplexer: plain wincmd (no wrap, same as stock vim).
end

local function map(lhs, wincmd, dir, desc)
  vim.keymap.set("n", lhs, function()
    nav(wincmd, dir)
  end, { silent = true, noremap = true, desc = desc })
end

map("<A-Left>", "h", "left", "Navigate left (vim/herdr)")
map("<A-Down>", "j", "down", "Navigate down (vim/herdr)")
map("<A-Up>", "k", "up", "Navigate up (vim/herdr)")
map("<A-Right>", "l", "right", "Navigate right (vim/herdr)")
