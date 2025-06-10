return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        -- Собираем fzf-native, иначе load_extension("fzf") упадёт
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "📂 Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "🔍 Live Grep" },
      { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "🐙 Git Files" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          prompt_prefix = " ",
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
          },
        },
      })
      -- Пытаемся загрузить fzf-расширение
      pcall(require("telescope").load_extension, "fzf")
    end,
  },
}
