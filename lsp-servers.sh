#!/bin/sh
echo '# Installing language servers'
npm i -g typescript \
	vscode-langservers-extracted \
	@kozer/emmet-language-server\
	intelephense\
	pyright\
	prettier\
	typescript-language-server\
	@tailwindcss/language-server

echo '# Installing clangd'
echo 'y' | sudo -S pacman -Sy cmake clang llvm
echo '# Installing cmake'
pip install --user cmake-language-server

