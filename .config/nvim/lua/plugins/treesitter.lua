return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			-- run :TSInstall whenever adding a new language here
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}
