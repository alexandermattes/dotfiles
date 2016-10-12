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
  curl
  exuberant-ctags
  fonts-hack-ttf
  git
  htop
  mc
  ncdu
  ppa-purge
  ranger
  ranger
  sl
  speedtest-cli
  telnet
  thefuck
  tmux
  trash-cli
  tree
  vim
)

packages=($(setdiff "${packages[*]}" "$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')"))

if (( ${#packages[@]} > 0 )); then
  e_header "Installing APT packages: ${packages[*]}"
  for package in "${packages[@]}"; do
    sudo apt-get -qq install "$package"
  done
fi
