## Explorer
Open = Ctrl + n
Close: q

```
["<BS>"] = "explorer_up",
["l"] = "confirm",
["h"] = "explorer_close", -- close directory
["a"] = "explorer_add",
["d"] = "explorer_del",
["r"] = "explorer_rename",
["c"] = "explorer_copy",
["m"] = "explorer_move",
["o"] = "explorer_open", -- open with system application
["P"] = "toggle_preview",
["y"] = { "explorer_yank", mode = { "n", "x" } },
["p"] = "explorer_paste",
["u"] = "explorer_update",
["<c-c>"] = "tcd",
["<leader>/"] = "picker_grep",
["<c-t>"] = "terminal",
["."] = "explorer_focus",
["I"] = "toggle_ignored",
["H"] = "toggle_hidden",
["Z"] = "explorer_close_all",
["]g"] = "explorer_git_next",
["[g"] = "explorer_git_prev",
["]d"] = "explorer_diagnostic_next",
["[d"] = "explorer_diagnostic_prev",
["]w"] = "explorer_warn_next",
["[w"] = "explorer_warn_prev",
["]e"] = "explorer_error_next",
["[e"] = "explorer_error_prev",
```

## Diagnostic 
These diagnostic keymaps are created unconditionally when Nvim starts:
]d jumps to the next diagnostic in the buffer. ]d-default
[d jumps to the previous diagnostic in the buffer. [d-default
]D jumps to the last diagnostic in the buffer. ]D-default
[D jumps to the first diagnostic in the buffer. [D-default
<C-w>d shows diagnostic at cursor in a floating window. CTRL-W_d-default


## TODO
- [x] buffer line
- [x] change color of git status in nvim tree
- [x] lsp
- [x] code foolding
- [ ] pyright, ruff, black, isort
- [ ] tsserver
- [ ] formatter
- [ ] lua line 
- [ ] session manger
- [ ] saghen/blink.cmp
- [ ] https://github.com/lewis6991/gitsigns.nvim
- [ ] colorify nvchad
- [ ] copilot
- [ ] Ocianic-next schema
- [ ] other ai plugins from front nvim
- [ ] todo comment finder and colorize
