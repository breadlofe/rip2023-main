#!/bin/sh
echo -ne '\033c\033]0;spaceship\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/spaceship.x86_64" "$@"
