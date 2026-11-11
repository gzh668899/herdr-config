# tmux 配置

老的 tmux 配置，从 [gzh668899/tmux](https://github.com/gzh668899/tmux) 搬进来，留着当备份。

现在日常主要用 herdr，键位思路（`Alt+方向键` 切窗格、`Alt+1..9` 切窗口、`-`/`|` 分屏）已经搬进 herdr，见 [`../herdr/README.md`](../herdr/README.md)。

## 装法

```bash
bash install.sh tmux        # 从仓库根目录跑，会先备份原 ~/.tmux.conf
tmux source-file ~/.tmux.conf   # 或重开会话
```

## 里面有什么

| 配置 | 说明 |
|---|---|
| `bind -` / `bind \|` | 垂直 / 水平分屏，新面板进当前目录 |
| `M-Left/Right/Up/Down` | 免前缀切窗格 |
| `M-1..9`、`M-0` | 免前缀切窗口（`M-0` 是第 10 个） |
| `base-index 1` / `pane-base-index 1` | 窗口和面板从 1 数起 |
| `C-v` | 粘贴 buffer |
| `mouse on` | 鼠标点击切面板、滚轮、拖边框 |
| 状态栏 | 黑底黄字，左对齐，左端 `❐ 会话名`，当前窗口红底 |
| `monitor-activity on` | 非当前窗口有输出时状态栏提示 |
| tmux-yank | 可选，路径不存在就自动跳过 |

## 和 herdr 的对应关系

| tmux | herdr |
|---|---|
| `prefix + \|` / `prefix + -` | `Ctrl+z` `v` / `Ctrl+z` `s` |
| `Alt+方向键` 切窗格 | `Alt+方向键`（还多一层：能穿进 nvim 分屏） |
| `Alt+1..9` 切窗口 | `Alt+1..9` 切 tab |
| `prefix + z` 缩放 | `Ctrl+z` `z` |
| copy mode（`prefix + [`） | `Ctrl+z` `[`，同样 vi 手感 |
| `C-w` capture-pane | `Ctrl+z` `Ctrl+s`（存到 `~/herdr-captures/`） |

herdr 没有的部分：TPM 插件体系、`prefix2`、前缀连按两次缩放、copy mode 的矩形选择与粘贴 buffer。
