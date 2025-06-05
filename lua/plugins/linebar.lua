return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = function()
    local utils = require("lualine.utils.utils")
    local function mode_color()
      return { fg = "#fff", bg = utils.extract_highlight_colors("Statement", "fg"), gui = "bold" }
    end
    local clocks = { "🕛", "🕐", "🕑", "🕒", "🕓", "🕔", "🕕", "🕖", "🕗", "🕘", "🕙", "🕚" }
    local function clock()
      return clocks[tonumber(os.date("%I"))] .. os.date(" %H:%M")
    end
    return {
      options = {
        theme = "auto",
        section_separators = { "", "" }, -- «пампушка» по бокам
        component_separators = { "", "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(s)
              return s:sub(1, 1)
            end,
            color = mode_color,
          },
        },
        lualine_b = { "branch", "diff" },
        lualine_x = {
          {
            function()
              local names = {}
              for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
                table.insert(names, client.name)
              end
              return #names > 0 and "  " .. table.concat(names, ", "):sub(1, 30) or "" -- усечём до 30 симв.
            end,
            padding = { left = 1, right = 1 },
          },
          "diagnostics",
        },
        lualine_c = { { "filetype", icon_only = false } },
        -- lualine_x = { "diagnostics", { "encoding" }, { "fileformat" } },
        lualine_y = { { "progress" } },
        lualine_z = { clock, "location" },
      },
      extensions = { "lazy", "mason", "quickfix" },
    }
  end,
}
