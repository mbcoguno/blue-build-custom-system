#!/usr/bin/env sh
set -euo pipefail

bash -c "$(curl -fsSL https://raw.githubusercontent.com/kata-containers/kata-containers/main/utils/kata-manager.sh) -o -t"
