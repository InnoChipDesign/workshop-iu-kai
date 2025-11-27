#!/usr/bin/env bash

set -Eeuo pipefail  # See the meaning in scripts/README.md
# set -x  # Print each command

#-------------------------------------------------------------------------------

find "$package_path" -name '*.sv'  \
    | xargs -n 1 sed -i '/START_SOLUTION/,/END_SOLUTION/d'

find "$package_path" -name '*.svh'  \
    | xargs -n 1 sed -i '/START_SOLUTION/,/END_SOLUTION/d'

#-------------------------------------------------------------------------------
