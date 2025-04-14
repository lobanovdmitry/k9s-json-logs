#!/bin/zsh

set -e

if [ -t 1 ] ; then
    kubectl logs "$@" 2>&1 | jq -CR '. as $line | try (fromjson) catch $line' | sed 's/\\n/\n/g; s/\\t/\t/g' | less -R -K
else
    kubectl logs "$@" | jq -R '. as $line | try (fromjson) catch $line'
fi

