# nvim-saugns

Syntax highlighting for the **SAU** language used by [`saugns`](https://codeberg.org/sau/saugns), for Vim and Neovim.

This plugin:

- Detects `*.sau` files as `filetype=sau`
- Adds simple syntax highlighting for:
  - Generators (`A`, `N`, `R`, `W`)
  - Comments (`//`, `/* ... */`, `#!`, `#Q`)
  - Numbers and fractions
  - Variables like `$seed`, `$foo`, `$~bar`
  - Labels (`'label`) and references (`@label`, `:label`)

It’s intentionally minimal but should be a nice base for editing SAU scripts.

---

## Installation

### With a plugin manager

**Packer.nvim**

```lua
use "thgrass/vim-saugns" 
```

or whatever you use, add `thgrass/vim-saugns` !

### Without a plugin manager

For Neovim:

```bash
mkdir -p ~/.config/nvim/pack/plugins/start
cd ~/.config/nvim/pack/plugins/start
git clone https://github.com/thgrass/vim-saugns.git
```

For vim:
```bash
mkdir -p ~/.vim/pack/plugins/start
cd ~/.vim/pack/plugins/start
git clone https://github.com/thgrass/vim-saugns.git
```

## Usage

After installation works on any file with `filetype=sau`, per default any file with `.sau` extension.

