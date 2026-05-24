setup-onepassword-groupid:
  getent group onepassword > /dev/null || sudo groupadd --gid 1500 onepassword
  getent group onepassword-cli > /dev/null || sudo groupadd --gid 1600 onepassword-cli
  # sudo groupadd --system onepassword-mcp  # my system is 957.
setup-docker-groupid:
  getent group docker > /dev/null || sudo groupadd --gid 964 docker
  sudo usermod --append --groups docker "$USER"
setup-libvirt-groupid:
  getent group libvirt > /dev/null || sudo groupadd --gid 961 libvirt
  sudo usermod --append --groups libvirt "$USER"
install-user-define-homebrew:
  brew bundle install --file /usr/share/ublue-os/homebrew/userdefine.Brewfile
