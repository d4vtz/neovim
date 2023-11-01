-- LSP configuration
return {
  setup = function (opts)
    opts = vim.tbl_deep_extend("force", require("config.lsp.default"), opts)
    local lspconfig = require("lspconfig")

    local mason_servers = {}
    for server, options in pairs(opts.servers) do
      if options.enable == true then
        lspconfig[server].setup(require("config.lsp.servers." .. server)(options))
     table.insert(mason_servers, server)
      end
    end

    -- Mason
    if opts.mason.enable then
      local mason_opts = {}
      if opts.mason.auto_install == true then
        mason_opts.ensure_installed = mason_servers
      end
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup(mason_opts)
    end
  end,
}
