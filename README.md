# Telescope-vimwiki-list.nvim
Switch between multiple [vimwiki](https://github.com/vimwiki/vimwiki) databases [using](using) [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).

## Use case

Vimwiki supports multiple databases, which are listed in the global array `vimwiki_list`, and which can be accessed by typing the array index before the Vimwiki command. For example:
```viml
  let g:vimwiki_list = [
		\ { 'name': 's1paper', 'path': '~/math/articles/s1paper/wiki/' },
		\ { 'name': 'hodgepaper', 'path': '~/math/articles/hodgepaper/wiki/' },
		\ { 'name': 'wolframL2', 'path': '~/projects/wolfram_level_2_certification_2024/wiki/' },
		...
		\ ]
```
This extension enables comfortable switching between these databases using telescope.

## Install

Install using [junegunn/vim-plug](https://github.com/junegunn/vim-plug):
```viml
Plug 'p135246/telescope-vimwiki-list'
```

## Setup

A prerequisite is to have [vimwiki](https://github.com/vimwiki/vimwiki) and [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) installed.

Load the extension:
```lua
lua require("telescope").load_extension("vimwiki_list")

```
Register a shortcut to open the telescope picker:
```viml
nnoremap <leader>vw <cmd>Telescope vimwiki_list picker<cr>
```

## Config

Configure using the field `extensions` inside of telescope:
```lua
require("telescope").setup {
  extensions = {
    vimwiki_list = {
      -- a file in the vimwiki directory to be previewed in telescope
      preview_file = "index.md"
    }
  },
}
```
