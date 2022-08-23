#!/usr/bin/env sh
set -e

echo 'starting ruby app'
bin/rails server -b 0.0.0.0 -p 3000
