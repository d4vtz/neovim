local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end


return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      theme = 'nord',
      globalstatus = true,
      inactive_winbar = {
        lualine_c = "filename",
      },
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch',  {'diff', source = diff_source}, 'diagnostics'},
      lualine_c = {{ "filename", file_status = true, path = 1, }},
      lualine_x = { {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = { fg = "#ff9e64" },
        }, 'searchcount', 'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
  },
}
