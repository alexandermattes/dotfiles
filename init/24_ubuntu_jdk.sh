# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

# Install APT packages.
packages=(
  eclipse
  openjdk-8-doc
  openjdk-8-jdk
  openjdk-8-jre
)

packages=($(setdiff "${packages[*]}" "$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')"))

if (( ${#packages[@]} > 0 )); then
  e_header "Installing APT packages: ${packages[*]}"
  for package in "${packages[@]}"; do
    sudo apt install "$package"
  done
fi
