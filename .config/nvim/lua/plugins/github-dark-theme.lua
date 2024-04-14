return {
	'projekt0n/github-nvim-theme',
	config = function()
		require('github-theme').setup({
			options = {
				transparent = true,
			},
			terminal_colors = true,
		})
		vim.cmd("colorscheme github_dark_default")
	end
}
