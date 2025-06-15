return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 15,
      open_mapping = nil, -- убрали Ctrl-\
      direction = "float",
      float_opts = { border = "curved", winblend = 3 },
      close_on_exit = true,
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      -- на всякий случай удаляем старые маппинги, если они ещё где-то висели
      pcall(vim.keymap.del, { "n", "t" }, "<C-/>")
      -- новый «ToggleTerm» на F4
      vim.keymap.set({ "n", "t" }, "<F4>", "<cmd>ToggleTerm<cr>", {
        desc = " Toggle Terminal",
      })

      -- и на <leader>ot (o = open, t = term)
      vim.keymap.set({ "n", "t" }, "<leader>ot", "<cmd>ToggleTerm<cr>", {
        desc = " Toggle Terminal",
      })

      -- в терминале Esc/C-c сразу в нормал-мод
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*toggleterm#*",
        callback = function()
          vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
          vim.api.nvim_buf_set_keymap(0, "t", "<C-c>", "<C-\\><C-n>", { noremap = true, silent = true })
        end,
      })
    end,
  },
}
