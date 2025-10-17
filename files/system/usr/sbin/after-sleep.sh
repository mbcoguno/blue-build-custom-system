#!/usr/bin/env sh

set -euo pipefail

echo 1 > /sys/bus/pci/devices/0000:c3:00.4/reset
# echo 1 > /sys/devices/pci0000:00/0000:00:08.1/0000:c3:00.4/reset
echo 1 > /sys/bus/pci/devices/0000:c3:00.4/remove
# echo 1 > /sys/devices/pci0000:00/0000:00:08.1/0000:c3:00.4/remove

echo 1 > /sys/bus/pci/rescan
