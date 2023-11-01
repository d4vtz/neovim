local on_attach = require("config.lsp.on_attach")

return function(opts)
  return vim.tbl_extend("force", {
  on_attach = on_attach,
  settings = {
    Lua = {
      telemetry = { enable = false },
      workspace = { checkThirdParty = false },
    }
  }
}, opts)
end
