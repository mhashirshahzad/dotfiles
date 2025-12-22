return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup {
      options = {
        component_separators = "",
        section_separators = "",
        globalstatus = true, -- single bottom bar
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
          "diff",
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn" },
            symbols = {
              error = " ",
              warn = " ",
            },
            on_click = function()
              require("telescope.builtin").diagnostics {
                severity = vim.diagnostic.severity.ERROR,
              }
            end,
          },
        },
        lualine_c = { "filename" },
        lualine_x = {
          "encoding",
          "filetype",
        },
        lualine_y = { "fileformat", "progress" },
        lualine_z = { "location" },
      },
    }
  end,
}
