local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local previewers = require('telescope.previewers')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local M = {
	config = {
		preview_file = 'index.md',
	}
}

local get_vimwiki_list = function(opts)
	local list = {}
	for index, wiki in ipairs(vim.g.vimwiki_list) do
		table.insert(list, { name = wiki.name, path = wiki.path, index = index })
	end
	return list
end

function M.vimwiki_list_picker(opts)
	local picker = pickers.new({}, {
		prompt_title = 'Vimwiki List',
		finder = finders.new_table {
			results = get_vimwiki_list(opts),
			entry_maker = function(entry)
				return {
					value = entry,
					display = entry.name,
					ordinal = entry.name,
					path = entry.path .. '/index.md'
				}
			end,
		},
		sorter = sorters.get_generic_fuzzy_sorter(opts),
		previewer = previewers.vim_buffer_cat.new {
			define_preview = function(self, entry, status)
				vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false,
					vim.fn.readfile(entry.path))
			end
		},
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				vim.cmd('call vimwiki#base#goto_index(' .. selection.value.index .. ')')
			end)
			return true
		end,
	})
	picker:find()
end
