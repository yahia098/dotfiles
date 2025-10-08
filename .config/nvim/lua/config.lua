require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd" },
})
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}
local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)
require("ibl").setup { 
    indent = { highlight = highlight,},
    exclude = {filetypes = {"txt","dashboard","help","lazy","checkhealth"}},
}
vim.lsp.config("clangd",{capabilities = require("cmp_nvim_lsp").default_capabilities(),})
vim.lsp.enable({"clangd",})
require("nvim-treesitter.configs").setup({
  ensure_installed = { "cpp", "c", "lua" },
  highlight = { enable = true },
})
local cmp = require("cmp")
cmp.setup({
  snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),

  }),
  sources = {
    { name = "nvim_lsp" , max_item_count = 7},
    {name = "buffer" , max_item_count = 7 } ,
    { name = "luasnip" , max_item_count = 7} ,
  },

})

require("dashboard").setup({
    theme = "doom",

})
