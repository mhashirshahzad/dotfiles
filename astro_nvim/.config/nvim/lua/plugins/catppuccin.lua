return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      dim_inactive = { enabled = true, percentage = 0.25 },

      -- swap blue and pink
      color_overrides = {
        mocha = {
          blue = "#f5c2e7",
          pink = "#89b4fa",
        },
      },

      highlight_overrides = {
        mocha = function(c)
          return {
            Normal = { bg = c.mantle },
            Comment = { fg = "#7687a0" },
            TabLineSel = { bg = c.pink },
            ["@tag.attribute"] = { fg = c.pink },
            ["@tag"] = { fg = c.pink },
            ["@tag.delimiter"] = { fg = c.pink },
          }
        end,
      },
    },
  },
}
