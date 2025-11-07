# nvim-saugns

Syntax highlighting for the **SAU** language used by [`saugns`](https://codeberg.org/sau/saugns), for Vim and Neovim.

This plugin provides filetype detection and highlighting for `.sau` scripts — the *Scriptable Audio* language behind **saugns**.

---

## Screenshot

Using 'Dracula' theme in vim (terminal) with one of the example source files from the saugns project:

<img alt="SAU syntax example" src="https://github.com/thgrass/vim-saugns/releases/download/v0.1.0/sau_dracula.png" />

---

## Features

- Detects `*.sau` files as `filetype=sau`
- Adds detailed syntax highlighting for:
  - **Generators** — `A`, `N`, `R`, `W` (e.g. `Wsin`, `Rsmo`)
  - **Sound-start command** — `S`
  - **Constants** — `pi`, `mf`, `T`
  - **Parameters** — `f`, `a`, `t`, `p`, `r`, `c`, `e`, etc.
  - **Numbers** — integers, floats (`.25`, `0.01`), fractions (`1/2`)
  - **f-context notes & MIDI constants** — `fC#4`, `fBb3`, `fM69`, including `$x = f A4`
  - **Variables** — `$seed`, `$foo`, `$~bar`
  - **Labels & references** — `'label`, `@label`, `:label`
  - **Operators & punctuation**
  - **Timing operators** — `;`, `|`, `/`, `\`
- Highlights generator type suffixes (`sin`, `saw`, `smo`, etc.) separately.
- Uses distinct colors for sound commands, constants, parameters, and timing operators.

It aims to stay lightweight but expressive enough to make SAU scripts easy to read and navigate.

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

---

## Usage

After installation works on any file with `filetype=sau`, per default any file with `.sau` extension.

---

## License

MIT
