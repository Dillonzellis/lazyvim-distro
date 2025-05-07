return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Get the existing tailwindcss server config or create a new one
      opts.servers = opts.servers or {}
      opts.servers.tailwindcss = opts.servers.tailwindcss or {}

      -- Extend the tailwindcss server settings
      opts.servers.tailwindcss.settings = vim.tbl_deep_extend("force", opts.servers.tailwindcss.settings or {}, {
        tailwindCSS = {
          experimental = {
            classRegex = {
              { "[\"'`]([^\"'`]*)[\"'`]" },
              { "\\b(class|className|\\w*Classes)\\b[^=]*=[^{]*[\"'`]([^\"'`]*)[\"'`]" },
              { ":\\s*[\"'`]([^\"'`]*)[\"'`]" },
              { "[\"'`](.*?)[\"'`]", "([^\"'`]*)" },
              { "cn\\([^)]*[\"'`]([^\"'`]*)[\"'`]" },
              { "classify\\([^)]*[\"'`]([^\"'`]*)[\"'`]" },
            },
          },
        },
      })

      return opts
    end,
  },
}
