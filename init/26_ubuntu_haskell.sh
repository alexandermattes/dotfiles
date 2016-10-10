# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

# Install APT packages.
packages=(
  haskell-platform
)

packages=($(setdiff "${packages[*]}" "$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')"))

if (( ${#packages[@]} > 0 )); then
  e_header "Installing APT packages: ${packages[*]}"
  for package in "${packages[@]}"; do
    sudo apt-get -qq install "$package"
  done
fi


#Update cabal
PATH=~/.cabal/bin:$PATH
cabal update
cabal install cabal


# Install cabal packages
cabalpackages=(
  hasktags
  hdevtools
  ghc-mod
)

if (( ${#cabalpackages[@]} > 0 )); then
  e_header "Installing cabal packages: ${cabalpackages[*]}"
  cabal update
  for package in "${cabalpackages[@]}"; do
    cabal install "$package"
  done
fi
