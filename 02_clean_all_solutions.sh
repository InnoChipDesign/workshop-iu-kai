#!/usr/bin/env bash

set -Eeuo pipefail  # See the meaning in scripts/README.md
# set -x  # Print each command

#-------------------------------------------------------------------------------

find "." -name '*.sv'  \
    | xargs -n 1 sed -i '/START_SOLUTION/,/END_SOLUTION/d'

#-------------------------------------------------------------------------------
