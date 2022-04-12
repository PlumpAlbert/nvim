#!/bin/sh
echo '# Installing language servers'
npm i -g typescript \
	typescript-language-server \
	vscode-langservers-extracted \
	@tailwindcss/language-server \
	@kozer/emmet-language-server \
	intelephense \
	pyright \
	prettier \
	blade-formatter \
	dockerfile-language-server-nodejs

echo '# Downloading phpcbf'
! [ -d "$HOME/.local/bin" ] && mkdir -p "$HOME/.local/bin"
curl -sL 'https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar' -o "$HOME/.local/bin/phpcs"
chmod a+x "$HOME/.local/bin/phpcs"
curl -sL 'https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar' -o "$HOME/.local/bin/phpcbf"
chmod a+x "$HOME/.local/bin/phpcbf"

echo '# Installing clangd and shfmt'
sudo -S pacman -Sy --needed --noconfirm cmake clang llvm shfmt
echo '# Installing cmake-language-server'
pip install --user cmake-language-server
