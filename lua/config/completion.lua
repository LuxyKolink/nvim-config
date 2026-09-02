vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

vim.keymap.set("i", "<C-space>", function()
  vim.lsp.completion.get()
end, { desc = "Trigger LSP completion" })
