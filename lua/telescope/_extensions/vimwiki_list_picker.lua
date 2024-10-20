return require 'telescope'.register_extension {
	exports = {
		vimwiki_list_picker = require("vimwiki_list_picker").vimwiki_list_picker,
	}
}
