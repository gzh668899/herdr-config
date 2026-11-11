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

---

# 键位

> 下面这份是**本仓库配置生效后的完整键位表**，覆盖 herdr 默认值的改动都标了「改动」，其余保持默认。
> 依据：`herdr --default-config`、`herdr config check`、herdr v0.9.5 源码（`src/input/keybind_help.rs` 等）。
> 随时按 `prefix+?` 打开 herdr 内置键位帮助（`/` 可以过滤），`prefix+Shift+s` 打开设置面板。

## 前缀

| 键 | 说明 |
|---|---|
| `Ctrl+z` | 前缀键（**改动**，默认 `Ctrl+b`） |

按一下 `Ctrl+z` 进入 prefix 模式，再按下一个键；或按住 `Ctrl+z` 直接按。下面所有 `prefix+x` 都是这个意思。

## 通用

| 键 | 作用 |
|---|---|
| `prefix+?` | 键位帮助（面板内 `/` 过滤，`Backspace` 编辑，`Ctrl+u` 清空） |
| `prefix+Shift+s` | 打开设置面板（**改动**，默认 `prefix+s`，该键被下面的水平分屏占用） |
| `prefix+q` | detach（离开但保留所有会话） |
| `prefix+Shift+r` | 重新加载 `config.toml` |
| `prefix+o` | 跳到发出通知的那个目标 |

## 导航模式（navigate mode）

`prefix+w` 进入工作区导航（侧边栏导航模式），`Esc` / `Ctrl+[` 退出。

| 键 | 作用 |
|---|---|
| `Esc` / `Ctrl+[` | 返回（退出导航模式） |
| `↑` / `↓` | 上下选工作区 |
| `h/j/k/l`、`←/→` | 在面板间移动焦点 |
| `Tab` / `Shift+Tab` | 循环下一个 / 上一个面板 |
| `Enter` | 打开选中的工作区 |
| `1..9` | 切到第 N 个工作区 |

`prefix+g` 打开会话导航器（Goto picker，agent / terminal 一行一个）：

| 键 | 作用 |
|---|---|
| `/` | 搜索名字、agent 类型、tab、工作区、分支、路径 |
| `↑`/`↓` 或 `j`/`k` | 在结果间移动（未在输入搜索时） |
| `←` / `→` | 跳到上一 / 下一个工作区块里的第一个 agent 或终端（不环绕） |
| `b` / `w` / `i` / `d` | 过滤 blocked / working / idle / done |
| `a` | 重新显示全部终端 |
| `Enter` | 跳转 |

## 工作区与 tab

| 键 | 作用 |
|---|---|
| `prefix+w` | 工作区导航（navigate mode） |
| `prefix+g` | 会话导航器 |
| `prefix+Shift+n` | 新建工作区 |
| `prefix+Shift+g` | 新建 git worktree |
| `prefix+Alt+w` | 打开已有 worktree 的 checkout（**新增绑定**，默认未绑定） |
| `prefix+Alt+Shift+w` | 删除 worktree，带确认（**新增绑定**，默认未绑定） |
| `prefix+.` | 重命名工作区（**改动**，默认 `prefix+Shift+w`，只留 `.`） |
| `prefix+Shift+d` | 关闭工作区（会二次确认） |
| `prefix+Alt+h` / `prefix+Alt+l` | 上一个 / 下一个工作区（**新增绑定**，默认未绑定） |
| `prefix+Alt+1..9` | 工作区 1–9 直切（**新增绑定**，默认未绑定） |
| `prefix+Alt+k` / `prefix+Alt+j` | 上一个 / 下一个 agent（**新增绑定**，默认未绑定） |
| `prefix+Shift+Alt+1..9` | agent 1–9 直跳（**新增绑定**，默认未绑定） |
| `prefix+c` | 新建 tab（与默认一致，显式写出） |
| `prefix+Shift+t` | 重命名 tab（默认） |
| `prefix+n` / `prefix+p` | 下一个 / 上一个 tab（与默认一致，显式写出） |
| `Alt+1..9` | 切到第 N 个 tab（**改动**，默认 `prefix+1..9`，改成免前缀） |
| `prefix+X` | 关闭 tab（**改动**，默认 `prefix+Shift+x`） |

## 面板

| 键 | 作用 |
|---|---|
| `prefix+s` | 水平分屏（上下，**改动**，默认 `prefix+minus`） |
| `prefix+v` | 垂直分屏（左右） |
| `prefix+h/j/k/l` | 焦点移到左/下/上/右面板（与默认一致） |
| `prefix+Tab` / `prefix+Shift+Tab` | 循环下一个 / 上一个面板 |
| `prefix+z` | 缩放（全屏）当前面板 |
| `prefix+r` | 进入 resize 模式 |
| `prefix+x` | 关闭面板 |
| `prefix+Shift+p` | 重命名面板 |
| `prefix+e` | 回滚编辑（edit scrollback，与默认一致） |
| `prefix+[` | copy mode |
| `prefix+b` | 折叠 / 展开侧边栏 |
| `prefix+Ctrl+s` | 保存当前面板输出到 `~/herdr-captures/`（**自加**，对应 tmux 的 `C-w` capture-pane） |

## 模式内部键

### copy mode（`prefix+[`）

浏览当前面板的回滚缓冲，面板进程不暂停、输出仍在继续。

| 键 | 作用 |
|---|---|
| `h/j/k/l`、方向键 | 上下左右移动 |
| `w` / `b` / `e` | 下一个词首 / 上一个词首 / 词尾 |
| `W` / `B` / `E` | 同上，但按空白分隔的「大词」 |
| `{` / `}` | 上一段 / 下一段 |
| `PageUp` / `PageDown` | 翻页 |
| `Ctrl+b` / `Ctrl+f` | 上翻 / 下翻一页 |
| `Ctrl+u` / `Ctrl+d` | 上翻 / 下翻半页 |
| `Home` / `End` | 行首 / 行尾 |
| `/` / `?` | 向前 / 向后搜索 |
| `n` / `N` | 重复搜索（同向 / 反向） |
| `v` 或 `Space` | 开始选择（`V` 也是选择） |
| `y` 或 `Enter` | 复制选中内容 |
| `q` / `Esc` | 退出（不复制）；`Esc` 先清选择/搜索再退出 |

### resize 模式（`prefix+r`）

| 键 | 作用 |
|---|---|
| `h` / `j` / `k` / `l`、方向键 | 把当前面板向左 / 下 / 上 / 右调整 |
| `Esc` / `Enter` / `prefix` | 退出 resize 模式 |

### 输入框编辑（命名对话框、过滤器、copy-mode 搜索）

只作用于 herdr 自己的输入框，不影响面板里的 shell。

| 键 | 作用 |
|---|---|
| `←/→`、`Ctrl+b` / `Ctrl+f` | 左右移一个字符 |
| `Home` / `End`、`Ctrl+a` / `Ctrl+e` | 跳到行首 / 行尾 |
| `Alt+b` / `Alt+f` | 左 / 右移一个词 |
| `Backspace`、`Ctrl+h` | 删前一个字符 |
| `Delete`、`Ctrl+d` | 删后一个字符 |
| `Ctrl+u` / `Ctrl+k` | 删到行首 / 行尾 |
| `Ctrl+w`、`Alt+Backspace`、`Ctrl+Backspace` | 删前一个词 |
| `Alt+d` | 删后一个词 |
| `Ctrl+y` | 粘贴刚才剪掉的文本 |

## 直接键（无需 prefix）

| 键 | 作用 |
|---|---|
| `Alt+←/↓/↑/→` | 无缝导航：nvim 分屏 ↔ herdr 面板，到边缘环绕 |
| `Alt+1..9` | 切 tab（**改动**） |
| `Ctrl+v` | 粘贴剪贴板图片（仅 `herdr --remote` 时生效） |

## 鼠标

herdr 是鼠标优先的：点侧边栏切工作区、点 tab 切 tab、点面板给焦点、拖面板分隔线改大小、右键出菜单、拖选文字自动复制、滚轮滚动。

## 自定义命令（`[[keys.command]]`）

`type` 三选一：`shell`（后台跑，不占布局）、`pane`（临时面板，命令结束即关）、`popup`（浮层终端，不动 tab 布局，`width`/`height` 支持百分比）。

| 键 | 作用 | type |
|---|---|---|
| `Alt+←/↓/↑/→` | 无缝导航：nvim 分屏 ↔ herdr 面板（走插件） | plugin_action |
| `prefix+Ctrl+s` | 保存当前面板输出到 `~/herdr-captures/` | shell |

想加自己的：照抄一条，`command` 写要跑的命令即可。比如 `type = "popup" command = "lazygit" width = "80%" height = "80%"`。

## 全量说明

`config.toml` 里 herdr 的**每个可绑键位都显式写出**了（默认值也照抄一遍），不再依赖“碰巧等于默认”。原本未绑定的 `open_worktree`、`remove_worktree`、`previous/next_workspace`、`switch_workspace`、`previous/next_agent`、`focus_agent` 也都给了键。
有意留空（不绑定）的四个动作：`clear_pane`（清屏）、`last_pane`（回上次面板）、`move_tab_previous/next`（挪 tab 位置）、`resize_pane_*`（免模式调大小）——用 `prefix+r` 的 resize 模式代替。

这么写的好处：看一个文件就知道所有键，按 `prefix+?` 得到的结果和文件一一对应；坏处是 herdr 升级新增的键位不会自动出现，需要手动补。

## 冲突约定

herdr 解析配置时**用户绑定优先**：用户占用了某个默认键，默认动作就被静默禁用，不会报错（`herdr config check` 也显示 `config: ok`）。
本仓库因此把默认 `prefix+s`（设置面板）挪到了 `prefix+Shift+s`。

---

## 仓库结构

```
.herdr/config.toml                      herdr 配置（键位 + 导航插件绑定）
.config/herdr/scripts/capture-pane.sh   保存面板输出到文件（prefix+Ctrl+w 调它）
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
