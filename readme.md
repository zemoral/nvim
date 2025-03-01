# nvim v0.10.2 

## Lua Language Server

Historically, the primary lua language server was named `sumneko_lua`. 
The server name was changed circa Q1 2023 to `lua_ls`

Mason already has alternative mappings from lsp/lspconfig default names
to those in the mapping provided by Mason - for lua, `lua-language-server`

`lspconfig` will emit a warning if `sumneko_lua` is is configured, favoring
the default naming of `lua_ls`

There may be errors around this. `lang.lua` use the `lua_ls` to prevent
the errors and use `LspInstall lua_ls` as well as `MasonInstall lua-language-server`
to to ensure proper lua linting.

## Custom Tree Sitter Captures
1. use nvim-treesiter/playground
   - :TSPlaygroundToggle
2. toggle query writer
   - <`o`> 
3. placecursor over capture to highlight  
   - @capture
4. add group and capture to file
   - .config/nvim/after/queries/{language}/{highlights,locals,injections,fold}.scm
   - file must start with `; extends`

## Colors
1. base16-colorscheme as a base
   - https://github.com/RRethy/nvim-base16 
2. colors customized with base16-colorscheme.highlight
3. neovim lsp semantic token highlighting support was introduced in 0.9
   - https://github.com/neovim/neovim/pull/21100

## Custom Patched Font
1. nerd font patched custom recursive fonts
    - https://www.recursive.design

## Telescope
1. sudo apt-get install ripgrep, fd-find; rg, fd
2. link fdfind to fd - its used by another package so must be manually linked
-  ln -s $(which fdfind) /usr/bin/fd

