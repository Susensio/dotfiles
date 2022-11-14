-- TreeSitter config
require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  sync_install = false,
--  auto_install = true,

  ensure_installed = {
	'python',
    'javascript',
    'css',
    'json',
    'lua',
	'bash',
	'fish',
	'dockerfile',
	'vim',
	'r'
  },
})
