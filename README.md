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
