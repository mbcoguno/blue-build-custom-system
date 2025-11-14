#!/usr/bin/env sh
set -euo pipefail

# bash -c "$(curl -fsSL https://raw.githubusercontent.com/kata-containers/kata-containers/main/utils/kata-manager.sh) -o -t"

# TODO: Get download URL from GitHub API.
download_url="https://github.com/kata-containers/kata-containers/releases/download/3.22.0/kata-static-3.22.0-amd64.tar.zst"
download_hashsum="sha256:9c8a1e8832a53bbb821b57b1fd8bda077c2d99adb22b655b7b6a567423b3cc3a"

curl -RL -o /tmp/kata-static-latest-amd64.tar.zst $download_url

tar --zstd -xvf /tmp/kata-static-latest-amd64.tar.zst -C /

ln -sf /opt/kata/bin/containerd-shim-kata-v2 /usr/bin/containerd-shim-kata-v2  # or /opt/kata/runtime-rs/bin/containerd-shim-kata-v2
ln -sf /opt/kata/bin/kata-collect-data.sh /usr/bin/kata-collect-data.sh
ln -sf /opt/kata/bin/kata-runtime /usr/bin/kata-runtime

sed -i -e "s|PLACEHOLDER_FOR_DISTRO_QEMU_WITH_TDX_SUPPORT|NOT_SUPPORTED|g" /opt/kata/share/defaults/kata-containers/configuration-qemu-tdx.toml
sed -i -e "s|PLACEHOLDER_FOR_DISTRO_OVMF_WITH_TDX_SUPPORT|NOT_SUPPORTED|g" /opt/kata/share/defaults/kata-containers/configuration-qemu-tdx.toml

rm -f /tmp/kata-static-latest-amd64.tar.zst
