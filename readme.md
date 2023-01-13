# nvim v0.8.0 

; extends
(type_declaration (type_spec name: (type_identifier) @type.declaration))
### TreeSitter Queries

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
7. transfer and download back in windows, set in settings


## Telescope
1. sudo apt-get install ripgrep, fd-find; rg, fd
