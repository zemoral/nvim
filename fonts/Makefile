root = /home/imorales/.config/fonts
# Recursive
font = $(root)/recursive-code-config
font-name = IMorales
font-version = 1.085
font-config = $(root)/imorales.yaml
font-out = RecMono$(font-name)
font-dir = $(font)/fonts/$(font-out)
# Nerd Font
nerd = $(root)/font-patcher
nerd-dir = $(root)/$(font-out)Nerd
nerd-font = --script $(nerd)/font-patcher --complete --mono --out=$(nerd-dir)
# Font Family
regular = $(root)/$(font-out)/$(font-out)-Regular-$(font-version).ttf
bold = $(root)/$(font-out)/$(font-out)-Bold-$(font-version).ttf
italic = $(root)/$(font-out)/$(font-out)-Italic-$(font-version).ttf
bold-italic = $(root)/$(font-out)/$(font-out)-BoldItalic-$(font-version).ttf 

help-nerd:
	fontforge --script $(font-patcher)/font-patcher --help

dependencies:
	git clone https://github.com/arrowtype/recursive-code-config.git;
	wget https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/font-patcher;
	wget https://github.com/fontforge/fontforge/releases/download/20220308/FontForge-2022-03-08-582bd41-x86_64.AppImage

base:
	cd $(font) && \
	. $(font)/venv/bin/activate && \
	python3 $(font)/scripts/instantiate-code-fonts.py $(font-config) && \
	mv $(font-dir) $(base-dir) && \
	cd $(base-dir) && deactivate

nerd:
	mkdir $(nerd-dir) && \
	fontforge $(nerd-font) $(regular) && \
	fontforge $(nerd-font) $(bold) && \
	fontforge $(nerd-font) $(italic) && \
	fontforge $(nerd-font) $(bold-italic) && \
	echo "Happy Coding :)"

family:
	fd Mono-Regular.ttf -x mv {} {//}/IMorales-Regular.ttf && \
	fd Mono-Bold.ttf -x mv {} {//}/IMorales-Bold.ttf && \
	fd Mono-Italic.ttf -x mv {} {//}/IMorales-Italic.ttf && \
	fd Mono-BoldItalic.ttf -x mc {} {//}/IMorales-BoldItalic.ttf
