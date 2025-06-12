#!/usr/bin/env bash
#
# SPDX-FileCopyrightText: 2023 DE:AD:10:C5 <franklin@dead10c5.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

set -euo pipefail
# IFS=$'\n\t'

declare -a arr=("aws" "az" "gcp" "ibm" "oci" "openshift")
for i in "${arr[@]}"
do
  echo "Cleaning up ${i} script"
  /home/franklin/go/bin/shfmt -l -w ../${i}/${i}_check.sh
done
