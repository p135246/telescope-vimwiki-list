local has_telescope, telescope = pcall(require, "telescope")

if not has_telescope then
	error "This plugin requires telescope.nvim (https://github.com/nvim-telescope/telescope.nvim)"
end

local vimwiki_list = require("vimwiki_list")

return telescope.register_extension {
	setup = function(ext_config, config)
		for key, value in pairs(ext_config) do
			if vimwiki_list.config[key] ~= nil then
				vimwiki_list.config[key] = value
			end
		end
	end,
	exports = {
		picker = vimwiki_list.vimwiki_list_picker,
	},
}
