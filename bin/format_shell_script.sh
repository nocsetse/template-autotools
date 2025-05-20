#!/usr/bin/env bash
#
# SPDX-FileCopyrightText: © 2024 DE:AD:10:C5  All rights reserved. <franklin@dead10c5.org>
#
# SPDX-License-Identifier:

# v0.1 | 02/15/2024 | initial version | franklin

# To install shfmt
# curl -sS https://webi.sh/shfmt | sh

set -euo pipefail
IFS=$'\n\t'

if ! command -v shfmt &>/dev/null; then
  echo "shfmt not found... installing!"
  curl -sS https://webi.sh/shfmt | sh
fi

if [ ! -d "docs" ] && [ ! -d "bin" ]; then
  echo "Run script from top level of repo"
  exit 1
fi

if ! command -v shfmt &>/dev/null; then
  echo "shfmt not found... installing!"
  curl -sS https://webi.sh/shfmt | sh
  MY_SHFMT="~/.local/bin/shfmt"
else
  MY_SHFMT=$(which shfmt)
fi

# check bootstrap.sh
echo "Checking file: bootstrap.sh"
${MY_SHFMT} -i 2 -l -w bootstrap.sh

# check the bin dir
for filename in "bin"/*.sh; do
  echo "Checking file: ${filename}"
  ${MY_SHFMT} -i 2 -l -w ${filename}
done
