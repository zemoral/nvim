# nvim v0.8.0 

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
1. downloaded from source 
    - https://www.recursive.design
2. moved into wsl 
    - $ transfer windows $FONT_DIR_PATH
3. font-patcher script download
    - wget https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/font-patcher
4. font-forge app image downloaded
    - wget https://github.com/fontforge/fontforge/releases/download/20220308/FontForge-2022-03-08-582bd41-x86_64.AppImage
5. download all the glyphs required, but not the entire repo
    - svn checkout https://github.com/ryanoasis/nerd-fonts/trunk/src/glyphs
6. execute the command
    - mkdir patched && ./FontForge.AppImage -script $PWD/font-patcher $PWD/$FONT_DIR_PATH/*.ttf $pwd/patched --compete

## Telescope
1. sudo apt-get install ripgrep, fd-find; rg, fd
2. link fdfind to fd - its used by another package so must be manually linked
-  ln -s $(which fdfind) /usr/bin/fd

