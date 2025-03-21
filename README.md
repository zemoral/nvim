# nvim v0.10.2 

## Custom Tree Sitter Captures
1. Use nvim-treesiter/playground
   - :TSPlaygroundToggle
2. Toggle query writer
   - <`o`> 
3. Placecursor over capture to highlight  
   - @capture
4. Add group and capture to file
   - .config/nvim/after/queries/{language}/{highlights,locals,injections,fold}.scm
   - file must start with `; extends`

## Colors
1. Base16-colorscheme as a base
   - https://github.com/RRethy/nvim-base16 
2. Colors customized with base16-colorscheme.highlight
3. Neovim lsp semantic token highlighting support was introduced in 0.9
   - https://github.com/neovim/neovim/pull/21100

## Custom Patched Font
1. Nerd font patched custom recursive fonts
    - fonts/README.md
    - https://www.recursive.design
