#!/usr/bin/env bash

set -Eeuo pipefail  # See the meaning in scripts/README.md
# set -x  # Print each command

#-------------------------------------------------------------------------------

find './01_halfadder' -name '*.sv'  \
    | xargs -n 1 sed -i '/START_SOLUTION/,/END_SOLUTION/d'

find './02_fulladder' -name '*.sv'  \
    | xargs -n 1 sed -i '/START_SOLUTION/,/END_SOLUTION/d'

find './03_adder' -name '*.sv'  \
    | xargs -n 1 sed -i '/START_SOLUTION/,/END_SOLUTION/d'

find './04_equality' -name '*.sv'  \
    | xargs -n 1 sed -i '/START_SOLUTION/,/END_SOLUTION/d'

#-------------------------------------------------------------------------------
