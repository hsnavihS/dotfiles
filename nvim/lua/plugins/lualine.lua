return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require('lualine').setup({
			options = {
				disabled_filetypes = {
					'neo-tree',
					'lazy'
				},
				theme = 'pywal',
			}
		})
	end
}
