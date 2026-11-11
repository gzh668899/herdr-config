# herdr-dotfiles

把 **herdr**（终端工作区管理器）和 **Neovim** 的导航配成一套连续空间：nvim 分屏和 herdr 面板之间用 `Alt+方向键` 直接穿越，走到边缘环绕到另一头。

```
Alt+→   nvim 左分屏 → nvim 右分屏 → 右边的 herdr 面板 → (到头) 跳到最左边的面板
Alt+←   反向同理
```

## 安装

```bash
git clone https://github.com/gzh668899/herdr-dotfiles.git ~/herdr-dotfiles
cd ~/herdr-dotfiles
bash install.sh
```

装完重启 herdr（或 herdr 内 `prefix Shift+R` 重载），重开 nvim。

## 依赖

| 依赖 | 说明 |
|---|---|
| herdr >= 0.9 | 脚本自动安装 |
| Neovim >= 0.10 | 需自行安装，脚本只检测 |
| jq | 脚本自动安装，插件靠它判断前台是不是 vim |
| 终端 | 能把 `Alt+方向键` 透传给 herdr：WezTerm / Windows Terminal / kitty 都可以 |

## 键位

### 导航

| 键 | 作用 |
|---|---|
| `Alt+←/↓/↑/→` | nvim 分屏间移动；到边缘穿到 herdr 面板；到头环绕到另一头 |
| `Alt+1..9` | 切到第 N 个 tab |
| `prefix+h/j/k/l` | 纯 herdr 面板导航（不做 vim 检测） |

### herdr（tmux 习惯）

`prefix` = `Ctrl+z`

| 键 | 作用 |
|---|---|
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
                                        nvim 侧导航（分屏移动 + 边缘穿越 + 环绕）
patches/navigate.sh.txt                 herdr 导航插件补丁（转发 Alt+方向键）
install.sh                              一键安装
```

## 工作原理

1. herdr 把 `Alt+方向键` 绑到 [vim-herdr-navigation](https://github.com/paulbkim-dev/vim-herdr-navigation) 插件的四个动作。
2. 插件用 `jq` 看当前面板的前台进程：是 nvim 就把按键转发进去，否则移动 herdr 焦点。
3. nvim 侧接管 `<A-Left/Down/Up/Right>`：先在 nvim 分屏里 `wincmd`；到边缘时用 `herdr pane neighbor` 探邻居——有就穿过去，没有就沿反方向走到最远的面板（环绕）。
4. 插件原版 `navigate.sh` 转发的是 `ctrl+hjkl`，本仓库的补丁把它改成 `alt+方向键`，和 nvim 侧映射一致。

## 已知取舍

- `Alt+←/→` 在 bash 里原本是按词跳转，被导航占用了；用 `Alt+b` / `Alt+f` 替代。
- nvim 内部环绕按窗口顺序近似，复杂网格下偶尔会绕到非预期窗口。
- 插件升级可能覆盖 `navigate.sh` 补丁，升级后重跑 `install.sh` 或手动复制 `patches/navigate.sh.txt`。
