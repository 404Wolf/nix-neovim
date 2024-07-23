# My Neovim Config

## My [NixVim](https://github.com/nix-community/nixvim) Neovim configuration

This is my [revious neovim configuration](https://github.com/404Wolf/neovim) for the most part, but ported to NixVim. Nix vim is a project that lets you write your neovim configuration in the `nix` programming langauge, providing really nice abstractions and giving you better guarentees of purity for things like `lua` nix packages with arbitrary dependencies (I'm looking at you guys, CHADtree and COQNvim!). I will eventually add options and make this better to use as a module. That's the next step.

# Keybinds

I like keybinds. I really like keybinds. There are so many keybinds. Okay here are the important ones.

Note that my leader key is space. Space is objectively the best leader key.

## Nix

- **Run `nix develop` without leaving**: `<leader>nd`

## Completions

These might be a bit weird at first

- **Tab through Them**: `<Tab>` and `<S-Tab>` to go up/down.
- **Accept one after you've tabbed**: `<Right>` or `<CR>`

## General

- **Quick command access**: `<leader><leader>` - `:`
- **Save all and exit**: `<c-q>` - `:wqa!<cr>`
- **Comment/uncomment selection**: `<c-/>` - `gc`
- **Select all text**: `<leader>aa` - `ggvg`

## Fuzzy finding

- **Fuzzy find**: `<leader>ff`
- **Fuzzy rip grep the project**: `<leader>fg`

## Tabs

- **Hopping around tabs**: `<A-0>` `<A-1>` ... `<A-9>` - `BufferGoto n`
- **Close tab**: `<A-c>`: `BufferClose`

## Window Management

- **Move cursor in split window**: 
  Basically `control` + `direction`...
  - **Down**: `<c-j>` - `<c-w>j`
  - **Up**: `<c-k>` - `<c-w>k`
  - **Left**: `<c-h>` - `<c-w>h`
  - **Right**: `<c-l>` - `<c-w>l`
- **Split window vertically**: `<leader>sv` - `:vsplit<cr>`
- **Split window horizontally**: `<leader>sh` - `:split<cr>`
- **Increase split width**: `<leader>hh` - `:vertical resize +8<cr>`
- **Decrease split width**: `<leader>ll` - `:vertical resize -8<cr>`
- **Increase split height**: `<leader>jj` - `:resize +8<cr>`
- **Decrease split height**: `<leader>kk` - `:resize -8<cr>`

## Code Folding

- **Toggle fold at cursor**: `zt` - `za`
- **Close fold at cursor**: `zc` - `:lua vim.wo.foldlevel = vim.wo.foldlevel - 1<cr>`
- **Open fold at cursor**: `zo` - `:lua vim.wo.foldlevel = vim.wo.foldlevel + 1<cr>`

## Tools and Plugins

- **Toggle aerial**: `<c-m>` - `<cmd>aerialtoggle<cr>`
  - Aerial is a super cool symbol tree bar on the right

- **Open chadtree**: `<c-n>` - `:CHADopen<cr>`
  - Chadtree is a very powerful file tree

- **Toggle autosave**: `<leader>as` - `:AStoggle<cr>`
  _ I like autosaving by default but sometimes it's annoying

## LSP stuff

- **Goto Definition**: `gd` - `definition`
- **Goto Declaration**: `gD` - `definition` (but preview, don't hop to it)
- **Goto References**: `gr` - `references`
- **Hover**: `K` - `hover` (view stuff about stuff)
- **Workspace Symbol**: `<leader>cw` - `workspace_symbol`
- **Rename**: `grn` - `rename`
- **Line Diagnostics**: `gld` - `open_float`
- **View Code action**: `gra`
- **Next Diagnostic**: `[d` - `goto_next`
- **Previous Diagnostic**: `]d` - `goto_prev`

# Copilot

I also have copilot, which you'll need to run `:Copilot auth` to set up.
