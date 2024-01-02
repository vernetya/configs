# LSP

## links
[nvim lsp help](https://neovim.io/doc/user/lsp.html), or `:h lsp`.
[lsp specs](https://microsoft.github.io/language-server-protocol/)

`mason` is a plugin that helps to install lsp-servers, DAP, linters ... but it can be done manually.
`lsp-config` is a plugin that helps configuring these lsp servers. Might be done [manually as well](https://dx13.co.uk/articles/2023/04/24/neovim-lsp-without-plugins/).


## lua

using [lsp-language-server](https://github.com/LuaLS/lua-language-server)

### install from releases

1- download it and uncompress it
2- optionally move to an appropriate location
3- add it to the `PATH`:
e.g. add it to the `.profile`
````
PATH="$HOME/bin/lua-ls/bin:$PATH"
````


## Python

using `python-lsp-server`. See [here](https://github.com/williamboman/mason-lspconfig.nvim/blob/main/lua/mason-lspconfig/server_configurations/pylsp/README.md)
as the expected way to install third party for pylsp. Unfortunalty for now `PylspInstall` command is not found, installed for some reason (likely dependencies 
order issues)

Then do `:LspInfo` when python lsp is loaded. This provides the virtual env on which to manually install third party plugins
like `pylsp-isort` or `python-lsp-back`.
