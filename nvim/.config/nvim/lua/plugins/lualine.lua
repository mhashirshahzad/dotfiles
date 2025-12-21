return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup {
      options = {
        section_separators = "",
        component_separators = "",
        globalstatus = true, -- single bottom bar
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn" },
            symbols = {
              error = " ",
              warn = " ",
            },
            on_click = function()
              vim.diagnostic.setloclist {
                severity = vim.diagnostic.severity.ERROR,
              }
              vim.cmd "lopen"
            end,
          },
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    }
  end,
}
