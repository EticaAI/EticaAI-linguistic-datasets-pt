#!/bin/sh
#===============================================================================
#
#          FILE:  commit_data-pt.etica.ai.sh
#
#         USAGE:  cat commit_data-pt.etica.ai.sh
#
#   DESCRIPTION:  [PT] commit_data-pt.etica.ai.sh não documentado no momento
#                 [PT] commit_data-pt.etica.ai.sh not documented yet
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  Etica.AI
#       LICENSE:  Public Domain / BSD Zero Clause License
#                 SPDX-License-Identifier: Unlicense OR 0BSD
#       VERSION:  1.0
#       CREATED:  2020-12-03 17:14 UTC
#      REVISION:  ---
#===============================================================================
echo "Usage:"
echo "    cat commit_data-pt.etica.ai.sh"
echo "exit 0 ..."
exit 0

#### Simples, apenas data
git commit -m "$(date -u +%Y-%m-%dT%H:%M:%S)"

#### Lazy commit
# @see https://stackoverflow.com/questions/35010953/how-to-automatically-generate-commit-message

# LANG=C git -c color.status=false status \
# | sed -n -r -e '1,/Changes to be committed:/ d' \
#             -e '1,1 d' \
#             -e '/^Untracked files:/,$ d' \
#             -e 's/^\s*//' \
#             -e '/./p'

git config --list
git config --global --list