#!/bin/sh
echo '# Installing null_ls servers'
npm i -g cspell \
  @cspell/dict-ru_ru \
  @kozer/emmet-language-server \
  @fsouza/prettierd \
  eslint_d

echo '# Downloading phpcbf'
! [ -d "$HOME/.local/bin" ] && mkdir -p "$HOME/.local/bin"
curl -sL 'https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar' -o "$HOME/.local/bin/phpcs"
chmod a+x "$HOME/.local/bin/phpcs"
curl -sL 'https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar' -o "$HOME/.local/bin/phpcbf"
chmod a+x "$HOME/.local/bin/phpcbf"

which pacman >/dev/null 2>&1
if [ $? -eq 0 ]; then
  echo '# Installing clangd and shfmt'
  sudo -S pacman -Sy --needed --noconfirm cmake clang llvm shfmt
fi
