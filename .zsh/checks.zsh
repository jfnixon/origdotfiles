# checks (stolen from zshuery)
if [[ $(uname) = 'Linux' ]]; then
  IS_LINUX=1
fi

if [[ $(uname) = 'Darwin' ]]; then
  IS_MAC=1
fi

if [[ -x `which brew` ]]; then
  HAS_BREW=1
fi
