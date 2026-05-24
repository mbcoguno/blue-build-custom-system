setup-onepassword-groupid:
  sudo groupadd --gid 1500 onepassword
  sudo groupadd --gid 1600 onepassword-cli
  # sudo groupadd --system onepassword-mcp  # my system is 957.
setup-docker-groupid:
  sudo groupadd --gid 964 docker
install-user-define-homebrew:
  brew bundle install --file /usr/share/ublue-os/homebrew/userdefine.Brewfile
