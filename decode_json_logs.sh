#!/bin/bash

set -e

kubectl logs "$@" 2>&1 | jq -CR '. as $line | try (fromjson) catch $line' | sed 's/\\n/\n/g; s/\\t/\t/g' | less -R -K
