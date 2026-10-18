local function pum_visible()
  return vim.fn.pumvisible() == 1
end

local function item_selected()
  return vim.fn.complete_info({ 'selected' }).selected ~= -1
end

vim.keymap.set('i', '<C-n>', function()
  return pum_visible() and '<Down>' or '<C-n>'
end, { expr = true, desc = 'Next completion item (highlight only)' })
vim.keymap.set('i', '<C-p>', function()
  return pum_visible() and '<Up>' or '<C-p>'
end, { expr = true, desc = 'Previous completion item (highlight only)' })
vim.keymap.set('i', '<CR>', function()
  return item_selected() and '<C-y>' or '<CR>'
end, { expr = true, desc = 'Confirm completion item' })

vim.keymap.set({ 'i', 's' }, '<Tab>', function()
  if pum_visible() then
    return '<Down>'
  end
  if vim.snippet.active({ direction = 1 }) then
    return '<Cmd>lua vim.snippet.jump(1)<CR>'
  end
  return '<Tab>'
end, { expr = true, silent = true, desc = 'Next completion item / snippet jump' })

vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
  if pum_visible() then
    return '<Up>'
  end
  if vim.snippet.active({ direction = -1 }) then
    return '<Cmd>lua vim.snippet.jump(-1)<CR>'
  end
  return '<S-Tab>'
end, { expr = true, silent = true, desc = 'Previous completion item / snippet jump' })
