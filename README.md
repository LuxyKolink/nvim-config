# Neovim Config

## LSP Keybinds

| Mode     | Key          | Action                              |
|----------|--------------|-------------------------------------|
| `n`      | `K`          | Hover documentation                 |
| `n`      | `gd`         | Go to definition                    |
| `n`      | `gD`         | Go to declaration                   |
| `n`      | `gi`         | Go to implementation                |
| `n`      | `go`         | Go to type definition               |
| `n`      | `gr`         | Show references                     |
| `n`      | `gs`         | Signature help                      |
| `n`      | `gl`         | Show line diagnostics in a float    |
| `n`      | `<F2>`       | Rename symbol                       |
| `n`, `x` | `<F3>`       | Format buffer                       |
| `n`, `x` | `<F4>`       | Code actions                        |
| `i`      | `<C-Space>`  | Trigger completion manually         |

## Built-in LSP Keybinds

| Mode      | Key      | Action                                      |
|-----------|----------|---------------------------------------------|
| `n`       | `grn`    | Rename symbol                               |
| `n`, `x`  | `gra`    | Code action                                 |
| `n`       | `grr`    | Show references                             |
| `n`       | `gri`    | Go to implementation                        |
| `n`       | `grt`    | Go to type definition                       |
| `n`       | `grx`    | Run code lens                               |
| `n`       | `gO`     | Show document symbols                       |
| `i`, `s`  | `<C-S>`  | Signature help                              |
| `i`, `s`  | `<Tab>`  | Next completion item, else snippet jump     |
| `i`, `s`  | `<S-Tab>`| Previous completion item, else snippet jump |
| `n`       | `]d`     | Next diagnostic                             |
| `n`       | `[d`     | Previous diagnostic                         |
| `n`       | `]D`     | Last diagnostic                             |
| `n`       | `[D`     | First diagnostic                            |
| `n`       | `<C-w>d` | Diagnostic under cursor (float)             |

## Completion

| Mode     | Key                 | Action                                                       |
|----------|---------------------|--------------------------------------------------------------|
| `i`      | `<C-Space>`         | Open the completion menu (LSP buffers)                       |
| `i`      | `<C-n>` / `<C-p>`   | Next / previous item — highlight only, does not insert       |
| `i`, `s` | `<Tab>` / `<S-Tab>` | Next / previous item when the menu is open, else snippet jump |
| `i`      | `<CR>`              | Accept the highlighted item, otherwise insert a newline      |
| `i`      | `<C-e>`             | Abort completion, keep what was typed                        |
| `i`      | `<Down>` / `<Up>`   | Same as `<C-n>` / `<C-p>` (highlight only)                   |

## Treesitter Keybinds

| Mode     | Key  | Action                 |
|----------|------|------------------------|
| `x`, `o` | `af` | Select around function |
| `x`, `o` | `if` | Select inside function |

## Folding

| Mode | Key  | Action                |
|------|------|-----------------------|
| `n`  | `zc` | Close fold            |
| `n`  | `zo` | Open fold             |
| `n`  | `za` | Toggle fold           |
| `n`  | `zM` | Close all folds       |
| `n`  | `zR` | Open all folds        |
| `n`  | `zr` | Open one level        |
| `n`  | `zm` | Close one level       |
| `n`  | `zj` | Next fold             |
| `n`  | `zk` | Previous fold         |
| `n`  | `[z` | Start of current fold |
| `n`  | `]z` | End of current fold   |
| `n`  | `zE` | Delete all folds      |

## Bootstrap

```sh
rm -rf /tmp/nts /tmp/nts-to /tmp/ts-go /tmp/ts-javascript /tmp/ts-nix /tmp/ts-php /tmp/ts-rust /tmp/ts-zig
mkdir -p ~/.config/nvim/parser ~/.config/nvim/queries

git clone --depth 1 --revision 29212d826054bb2948fa9d3a99eca9bf6a050eb2 https://github.com/nvim-treesitter/nvim-treesitter /tmp/nts
cp -r /tmp/nts/runtime/queries/{go,javascript,nix,php,php_only,rust,zig,ecma,jsx} ~/.config/nvim/queries/
git clone --depth 1 --revision 5c7b0263797dfd1bd6202f2b219f3b53a80b2187 https://github.com/nvim-treesitter/nvim-treesitter-textobjects /tmp/nts-to
cp -r /tmp/nts-to/queries/{c,lua,go,javascript,nix,php,php_only,rust,zig,ecma,jsx} ~/.config/nvim/queries/

git clone --depth 1 --revision 2346a3ab1bb3857b48b29d779a1ef9799a248cd7 https://github.com/tree-sitter/tree-sitter-go /tmp/ts-go && (cd /tmp/ts-go && tree-sitter build -o "$HOME/.config/nvim/parser/go.so")
git clone --depth 1 --revision 58404d8cf191d69f2674a8fd507bd5776f46cb11 https://github.com/tree-sitter/tree-sitter-javascript /tmp/ts-javascript && (cd /tmp/ts-javascript && tree-sitter build -o "$HOME/.config/nvim/parser/javascript.so")
git clone --depth 1 --revision 32c3ce98afdafc2ec9aedf0280a678750f76254c https://github.com/nix-community/tree-sitter-nix /tmp/ts-nix && (cd /tmp/ts-nix && tree-sitter build -o "$HOME/.config/nvim/parser/nix.so")
git clone --depth 1 --revision 58d5643086ae60e93a3746cca648363ee97c8761 https://github.com/tree-sitter/tree-sitter-php /tmp/ts-php && (cd /tmp/ts-php/php && tree-sitter build -o "$HOME/.config/nvim/parser/php.so") && (cd /tmp/ts-php/php_only && tree-sitter build -o "$HOME/.config/nvim/parser/php_only.so")
git clone --depth 1 --revision 77a3747266f4d621d0757825e6b11edcbf991ca5 https://github.com/tree-sitter/tree-sitter-rust /tmp/ts-rust && (cd /tmp/ts-rust && tree-sitter build -o "$HOME/.config/nvim/parser/rust.so")
git clone --depth 1 --revision 6479aa13f32f701c383083d8b28360ebd682fb7d https://github.com/tree-sitter-grammars/tree-sitter-zig /tmp/ts-zig && (cd /tmp/ts-zig && tree-sitter build -o "$HOME/.config/nvim/parser/zig.so")

nvim --headless -c 'lua for _,l in ipairs({"go","javascript","nix","php","php_only","rust","zig"}) do local ok,e=vim.treesitter.language.add(l); print(l, ok and "ok" or e) end' -c 'qa'
```
