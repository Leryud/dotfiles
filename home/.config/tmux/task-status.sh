#!/bin/bash
# Segment de statut Taskwarrior pour tmux : "✓<pending>  ⏰<due-today>"
command -v task >/dev/null 2>&1 || exit 0
pending=$(task status:pending count 2>/dev/null)
due=$(task +DUE +PENDING count 2>/dev/null)
[ -z "$pending" ] && exit 0
out="#[fg=#4caf50]✓${pending}"
[ -n "$due" ] && [ "$due" -gt 0 ] 2>/dev/null && out="${out} #[fg=#e5c07b]⏰${due}"
echo "$out"
