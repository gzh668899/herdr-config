#!/usr/bin/env bash
# herdr-dotfiles installer
# 一键把 herdr + nvim 无缝导航这套配置装到任意 Linux/WSL 机器。
# 需要：bash, git, curl, sudo（装 jq 用）。
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HERDR_HOME="${HOME}/.config/herdr"
NVIM_HOME="${HOME}/.config/nvim"

log()  { printf '\033[1;32m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m[!]\033[0m %s\n' "$*"; }

# ---------------------------------------------------------------- 1. 依赖
log "检查依赖 (jq / git / curl)"
missing=()
command -v jq   >/dev/null || missing+=(jq)
command -v git  >/dev/null || missing+=(git)
command -v curl >/dev/null || missing+=(curl)
if [ ${#missing[@]} -gt 0 ]; then
  log "安装缺失依赖: ${missing[*]}"
  sudo apt-get update -qq && sudo apt-get install -y "${missing[@]}"
fi

# ---------------------------------------------------------------- 2. herdr
if ! command -v herdr >/dev/null; then
  log "安装 herdr"
  curl -fsSL https://herdr.dev/install.sh | sh
  export PATH="${HOME}/.local/bin:${PATH}"
else
  log "herdr 已存在: $(herdr --version 2>/dev/null || echo ok)"
fi

# ---------------------------------------------------------------- 3. nvim
if ! command -v nvim >/dev/null; then
  warn "未检测到 nvim，请先安装 Neovim >= 0.10 后重新运行本脚本"
  warn "参考: https://github.com/neovim/neovim/releases (可用 AppImage 放到 ~/.local/bin)"
  exit 1
fi

# ---------------------------------------------------------------- 4. nvim 配置
if [ ! -d "$NVIM_HOME" ]; then
  log "克隆 archvim (archibate/vimrc, 分支 nvim-2)"
  git clone -b nvim-2 https://github.com/archibate/vimrc "$NVIM_HOME"
else
  log "nvim 配置已存在，跳过克隆（只覆盖导航脚本）"
fi

# ---------------------------------------------------------------- 5. herdr 配置
log "写入 herdr 配置"
mkdir -p "$HERDR_HOME"
cp "$REPO_DIR/.herdr/config.toml" "$HERDR_HOME/config.toml"

# ---------------------------------------------------------------- 6. 导航插件
log "安装 vim-herdr-navigation 插件"
export PATH="${HOME}/.local/bin:${PATH}"
herdr plugin install paulbkim-dev/vim-herdr-navigation --yes 2>/dev/null || \
  herdr plugin install paulbkim-dev/vim-herdr-navigation

# ---------------------------------------------------------------- 7. 插件脚本补丁
# 插件默认转发 ctrl+hjkl 给 vim；本仓库把导航键改成 Alt+方向键，
# 所以补丁后的 navigate.sh 转发 alt+方向键。
NAV_SH="$(find "$HERDR_HOME/plugins" -path '*checkout/navigate.sh' 2>/dev/null | head -1 || true)"
if [ -n "$NAV_SH" ]; then
  log "打补丁: $NAV_SH"
  cp "$NAV_SH" "$NAV_SH.bak.$(date +%s)"
  cp "$REPO_DIR/patches/navigate.sh.txt" "$NAV_SH"
  chmod +x "$NAV_SH"
else
  warn "没找到插件 checkout 里的 navigate.sh，稍后手动复制 patches/navigate.sh.txt 过去"
fi

# ---------------------------------------------------------------- 8. nvim 侧脚本
log "写入 nvim 导航脚本"
mkdir -p "$NVIM_HOME/after/plugin"
cp "$REPO_DIR/.config/nvim/after/plugin/herdr-navigation.lua" \
   "$NVIM_HOME/after/plugin/herdr-navigation.lua"

# ---------------------------------------------------------------- 9. 可选代理
if [ "${WITH_PROXY:-0}" = "1" ]; then
  log "追加代理配置到 ~/.bashrc (WITH_PROXY=1)"
  if ! grep -q 'WSL auto proxy' ~/.bashrc 2>/dev/null; then
    printf '\n' >> ~/.bashrc
    cat "$REPO_DIR/bashrc-proxy.txt" >> ~/.bashrc
  fi
fi

# ---------------------------------------------------------------- 10. 校验
log "配置校验"
herdr config check 2>&1 || true
command -v jq >/dev/null && log "jq: $(jq --version)"

cat <<'EOF'

安装完成。生效步骤：
  1. 重启 herdr（或进 herdr 后 Ctrl+z Shift+R 重载配置）
  2. 重新打开 nvim

导航键位：
  Alt+←/↓/↑/→   nvim 分屏 ↔ herdr 面板 无缝穿越（边缘环绕）
  Alt+1..9       切换 herdr tab
  prefix+s/v     分屏；prefix+h/j/k/l 面板导航；prefix+z 缩放
EOF
