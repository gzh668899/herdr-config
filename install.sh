#!/usr/bin/env bash
# dotfiles installer —— herdr / nvim / tmux 三件套
#
#   bash install.sh            # 全装
#   bash install.sh herdr      # 只装 herdr（配置 + 导航插件 + 存面板输出）
#   bash install.sh nvim       # 只装 nvim（archvim 配置 + 导航脚本）
#   bash install.sh tmux       # 只装 tmux（~/.tmux.conf）
#
# 需要：bash, git, curl, sudo（装 jq 用）。
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HERDR_HOME="${HOME}/.config/herdr"
NVIM_HOME="${HOME}/.config/nvim"

log()  { printf '\033[1;32m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m[!]\033[0m %s\n' "$*"; }
have() { command -v "$1" >/dev/null 2>&1; }

backup_dir() {
  local dir="$1"
  [ -e "$dir" ] || return 0
  local bak="${dir}.bak.$(date +%s)"
  mv "$dir" "$bak"
  warn "已备份原有 $dir → $bak"
}

install_deps() {
  log "检查依赖 (jq / git / curl)"
  local missing=()
  have jq   || missing+=(jq)
  have git  || missing+=(git)
  have curl || missing+=(curl)
  if [ ${#missing[@]} -gt 0 ]; then
    log "安装缺失依赖: ${missing[*]}"
    sudo apt-get update -qq && sudo apt-get install -y "${missing[@]}"
  fi
}

install_herdr() {
  if ! have herdr; then
    log "安装 herdr"
    curl -fsSL https://herdr.dev/install.sh | sh
    export PATH="${HOME}/.local/bin:${PATH}"
  else
    log "herdr 已存在: $(herdr --version 2>/dev/null || echo ok)"
  fi

  log "写入 herdr 配置"
  mkdir -p "$HERDR_HOME/scripts"
  cp "$REPO_DIR/herdr/config.toml" "$HERDR_HOME/config.toml"
  cp "$REPO_DIR/herdr/scripts/capture-pane.sh" "$HERDR_HOME/scripts/capture-pane.sh"
  chmod +x "$HERDR_HOME/scripts/capture-pane.sh"

  log "安装 vim-herdr-navigation 插件"
  export PATH="${HOME}/.local/bin:${PATH}"
  herdr plugin install paulbkim-dev/vim-herdr-navigation --yes 2>/dev/null || \
    herdr plugin install paulbkim-dev/vim-herdr-navigation

  # 插件默认转发 ctrl+hjkl 给 vim；本仓库用 Alt+方向键，所以要打补丁。
  local nav_sh
  nav_sh="$(find "$HERDR_HOME/plugins" -path '*checkout/navigate.sh' 2>/dev/null | head -1 || true)"
  if [ -n "$nav_sh" ]; then
    log "打补丁: $nav_sh"
    cp "$nav_sh" "$nav_sh.bak.$(date +%s)"
    cp "$REPO_DIR/herdr/patches/navigate.sh.txt" "$nav_sh"
    chmod +x "$nav_sh"
  else
    warn "没找到插件 checkout 里的 navigate.sh，稍后手动复制 herdr/patches/navigate.sh.txt 过去"
  fi

  log "配置校验"
  herdr config check 2>&1 || true
  have jq && log "jq: $(jq --version)"
}

install_nvim() {
  if ! have nvim; then
    warn "未检测到 nvim，请先安装 Neovim >= 0.10 后重跑：bash install.sh nvim"
    warn "参考: https://github.com/neovim/neovim/releases (AppImage 放到 ~/.local/bin 即可)"
    exit 1
  fi

  log "写入 nvim 配置（archvim 源码）"
  backup_dir "$NVIM_HOME"
  mkdir -p "$NVIM_HOME"
  for item in init.vim lua plugin scripts after; do
    [ -e "$REPO_DIR/nvim/$item" ] && cp -R "$REPO_DIR/nvim/$item" "$NVIM_HOME/"
  done

  # 导航脚本（本仓库自有，覆盖 archvim 的 C-hjkl 映射）
  mkdir -p "$NVIM_HOME/after/plugin"
  cp "$REPO_DIR/nvim/after/plugin/herdr-navigation.lua" \
     "$NVIM_HOME/after/plugin/herdr-navigation.lua"

  if [ ! -d "$NVIM_HOME/lua/archvim/predownload" ]; then
    warn "本仓库不含 archvim 的插件本体（119MB predownload/）"
    warn "首次启动 nvim 会按 lua/archvim/plugins.lua 自行下载插件（需要网络）"
  fi
}

install_tmux() {
  log "写入 ~/.tmux.conf"
  if [ -f "$HOME/.tmux.conf" ]; then
    cp "$HOME/.tmux.conf" "$HOME/.tmux.conf.bak.$(date +%s)"
    warn "已备份原有 ~/.tmux.conf"
  fi
  cp "$REPO_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
}

TARGETS=("$@")
[ ${#TARGETS[@]} -eq 0 ] && TARGETS=(herdr nvim tmux)

install_deps
for t in "${TARGETS[@]}"; do
  case "$t" in
    herdr) install_herdr ;;
    nvim)  install_nvim ;;
    tmux)  install_tmux ;;
    *)     warn "未知目标: $t（可选 herdr / nvim / tmux）" ;;
  esac
done

cat <<'EOF'

完成。生效步骤：
  1. 重启 herdr（或进 herdr 后 Ctrl+z Shift+R 重载配置）
  2. 重新打开 nvim
  3. 重开 tmux 会话（tmux source-file ~/.tmux.conf 也行）

导航键位：
  Alt+←/↓/↑/→   nvim 分屏 ↔ herdr 面板 无缝穿越（边缘环绕）
  Alt+1..9      切换 herdr tab
  prefix+s/v    分屏；prefix+h/j/k/l 面板导航；prefix+z 缩放
EOF
