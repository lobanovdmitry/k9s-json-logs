#!/bin/zsh

set -e
RED="\033[0;31m"

if [ -t 1 ] ; then
    # https://github.com/derailed/k9s/issues/1852#issuecomment-2004674600
    kubectl logs "$@" 2>&1 | jq -cCR '. as $line | try (fromjson) catch $line' | less -R -K
else
    kubectl logs "$@" | jq -R '. as $line | try (fromjson) catch $line'
fi

