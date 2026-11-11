#!/usr/bin/env bash
# 保存当前面板的输出到文件（对应 tmux 的 prefix+C-w: capture-pane）。
# 用法：capture-pane.sh            → 存当前焦点面板
#       capture-pane.sh w1:p3      → 存指定面板
set -uo pipefail
export PATH="$HOME/.local/bin:$PATH"

pane="${1:-${HERDR_PANE_ID:-}}"
if [ -z "$pane" ]; then
  pane="$(herdr pane current 2>/dev/null \
    | grep -o '"pane_id":"[^"]*"' | head -1 | cut -d'"' -f4)"
fi
if [ -z "$pane" ]; then
  echo "capture-pane: 拿不到当前面板 id" >&2
  exit 1
fi

outdir="${HERDR_CAPTURE_DIR:-$HOME/herdr-captures}"
mkdir -p "$outdir"
out="$outdir/$(date +%Y%m%d-%H%M%S)-${pane//:/_}.txt"

# recent-unwrapped = 完整回滚缓冲（不按屏幕宽度折行）
if ! herdr pane read "$pane" --source recent-unwrapped >"$out" 2>/dev/null; then
  herdr pane read "$pane" --source recent >"$out"
fi

lines=$(wc -l <"$out" | tr -d ' ')
herdr notification show "面板已保存 (${lines} 行)" \
  --body "$out" --position bottom-right --sound none >/dev/null 2>&1 || true
printf '%s\n' "$out"
