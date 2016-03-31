# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

# Update APT.
e_header "Updating APT"
sudo apt update
sudo apt full-upgrade

# Install APT packages.
packages=(
  bsdgames
  build-essential
  cmake
  cowsay
  git
  htop
  mc
  ncdu
  ranger
  sl
  telnet
  tmux
  tree
  vim
  ranger
)

packages=($(setdiff "${packages[*]}" "$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')"))

if (( ${#packages[@]} > 0 )); then
  e_header "Installing APT packages: ${packages[*]}"
  for package in "${packages[@]}"; do
    sudo apt install "$package"
  done
fi
