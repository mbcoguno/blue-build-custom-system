setup-onepassword-groupid:
  getent group onepassword > /dev/null || sudo groupadd --gid 1500 onepassword
  getent group onepassword-cli > /dev/null || sudo groupadd --gid 1600 onepassword-cli
  getent group onepassword-mcp > /dev/null || sudo groupadd --system onepassword-mcp
setup-docker-groupid:
  # docker comes from Homebrew (no /usr/lib/group entry), so create the group
  # with a dynamic system GID rather than a hardcoded one. A fixed GID picked
  # while a slot was free can collide later as releases add packages (e.g. the
  # clevis/docker 964 clash on a system upgraded from bazzite 42).
  getent group docker > /dev/null || sudo groupadd --system docker
  sudo usermod --append --groups docker "$USER"
setup-libvirt-groupid:
  # libvirt is an RPM-provided group; reuse the GID its sysusers assigned in
  # /usr/lib/group (mirrors ublue-os/bazzite-dx's bazzite-dx-groups) rather than
  # hardcoding one. Fall back to a dynamic system GID if the entry is absent.
  grep -q "^libvirt:" /etc/group || grep "^libvirt:" /usr/lib/group | sudo tee -a /etc/group > /dev/null
  getent group libvirt > /dev/null || sudo groupadd --system libvirt
  sudo usermod --append --groups libvirt "$USER"
install-user-define-homebrew:
  brew bundle install --file /usr/share/ublue-os/homebrew/userdefine.Brewfile
start-homebrew-rootful-docker:
  # docker-engine comes from Homebrew; run its daemon as a system-level systemd
  # unit. --preserve-env=HOME keeps root pointed at the user's Homebrew prefix so
  # it can find the formula and binary. Run after install-user-define-homebrew.
  sudo --preserve-env=HOME brew services start docker-engine
