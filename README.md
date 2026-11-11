# herdr-dotfiles

在 WSL / Linux 上把 **herdr**（AI agent 的终端工作区管理器）、**Neovim**、以及两者之间的**无缝导航**配成一套，换机器一条命令装上。

核心体验：**nvim 分屏和 herdr 面板是一个连续的空间**，`Alt+方向键` 一路走，边缘自动环绕。

```
Alt+→   nvim 左分屏 → nvim 右分屏 → herdr 邻居面板 → (到头) 跳回最左边
Alt+←   反向同理
```

## 一键安装

```bash
git clone https://github.com/gzh668899/herdr-dotfiles.git ~/herdr-dotfiles
cd ~/herdr-dotfiles
bash install.sh

# 想顺带配置 WSL 里的 Windows 代理（127.0.0.1:7892）：
WITH_PROXY=1 bash install.sh
```

装完重启 herdr（或 herdr 内 `Ctrl+z Shift+R` 重载），重开 nvim。

## 依赖

- herdr >= 0.9（脚本会自动装）
- Neovim >= 0.10（需自行安装，脚本只检测）
- jq（脚本自动装，herdr 导航插件靠它识别前台是不是 vim）
- 终端需能把 `Alt+方向键` 传给 herdr（WezTerm / Windows Terminal / kitty 均可）

## 键位总表

### 导航（无缝穿越）

| 键 | 作用 |
|---|---|
| `Alt+←/↓/↑/→` | nvim 分屏间移动；到边缘穿到 herdr 面板；到头的方向环绕到另一头 |
| `Alt+1..9` | 切换到第 N 个 herdr tab |
| `prefix+h/j/k/l` | herdr 面板间导航（不带 vim 检测，纯面板移动） |

### herdr（tmux 习惯）

| 键 | 作用 |
|---|---|
| `Ctrl+z` 或 `Ctrl+s` | prefix 键（两次发送字面量） |
| `prefix+s` / `prefix+v` | 水平 / 垂直分屏 |
| `prefix+c` / `prefix+t` | 新建 tab |
| `prefix+n` / `prefix+p` | 下一个 / 上一个 tab |
| `prefix+,` | 重命名 tab |
| `prefix+z` | 缩放面板 |
| `prefix+;` | 跳到上一个面板 |
| `prefix+x` | 关闭面板 |
| `prefix+e` / `prefix+Esc` | 回滚编辑（copy-mode） |

## 仓库结构

```
.herdr/config.toml                      herdr 配置（键位 + 导航插件绑定）
.config/nvim/after/plugin/herdr-navigation.lua
                                        nvim 侧导航脚本（边缘环绕逻辑）
patches/navigate.sh.txt                 herdr 导航插件补丁（转发 Alt+方向键）
bashrc-proxy.txt                        WSL 自动代理片段（可选）
wezterm/.wezterm.lua                    WezTerm 中文乱码修复配置（可选）
install.sh                              一键安装
```

## 工作原理

1. herdr 把 `Alt+方向键` 绑到 [vim-herdr-navigation](https://github.com/paulbkim-dev/vim-herdr-navigation) 插件的四个动作。
2. 按键时插件用 `jq` 读当前面板的前台进程：是 nvim 就把按键转发进去，否则移动 herdr 焦点。
3. nvim 侧脚本接管 `<A-Left/Down/Up/Right>`：先在 nvim 分屏间 `wincmd`；到边缘时用 `herdr pane neighbor` 探测相邻面板——有就穿过去，没有就跳到另一头最远的 herdr 面板（环绕）。
4. 插件原版 `navigate.sh` 写死转发 `ctrl+hjkl`，本仓库打了补丁改成转发 `alt+方向键`（对应 nvim 侧的新映射）。

## 已知取舍

- `Alt+←/→` 在 bash 里本来可用于按词跳转（readline），被导航占用；可用 `Alt+b` / `Alt+f` 替代。
- nvim 内部的窗口环绕按窗口顺序（线性近似），复杂网格下偶尔绕到非预期窗口。
- 插件更新可能覆盖 `navigate.sh` 补丁，更新后重跑 `install.sh` 的补丁步骤或手动复制 `patches/navigate.sh.txt`。
