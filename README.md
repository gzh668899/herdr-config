# herdr-config

我的终端工作环境配置，三块拼在一起用：

| 目录 | 是什么 | 一句话 |
|---|---|---|
| [`herdr/`](herdr/README.md) | [herdr](https://herdr.dev) 工作区管理器配置 | 前缀 `Ctrl+z`、tmux 手感的键位、全量显式写死 |
| [`nvim/`](nvim/README.md) | Neovim 配置（[archvim](https://github.com/archibate/vimrc) 分支 `nvim-2` + 我的改动） | 只收配置源码，不含 119MB 插件本体 |
| [`tmux/`](tmux/README.md) | 老的 tmux 配置 | 留着当备份，键位思路已经搬进 herdr |

三者的交集是**无缝导航**：nvim 分屏和 herdr 面板是同一个连续空间，`Alt+方向键` 直接穿过去，走到边缘环绕到另一头。

```
Alt+→   nvim 左分屏 → nvim 右分屏 → 右边的 herdr 面板 → (到头) 跳到最左边的面板
Alt+←   反向同理
```

## 安装

```bash
git clone https://github.com/gzh668899/herdr-config.git ~/herdr-config
cd ~/herdr-config

bash install.sh           # 三件套全装
bash install.sh herdr     # 只装 herdr
bash install.sh nvim      # 只装 nvim
bash install.sh tmux      # 只装 tmux
```

装完重启 herdr（或 herdr 内 `Ctrl+z` `Shift+R` 重载），重开 nvim。

## 键位速查

完整表在 [`herdr/README.md`](herdr/README.md#键位)，这里只放最常用的：

| 键 | 作用 |
|---|---|
| `Alt+←/↓/↑/→` | nvim 分屏 ↔ herdr 面板 无缝穿越（边缘环绕） |
| `Ctrl+z` | herdr 前缀键 |
| `Ctrl+z` + `s` / `v` | 水平 / 垂直分屏 |
| `Ctrl+z` + `h/j/k/l` | 面板间移动焦点 |
| `Ctrl+z` + `z` | 当前面板全屏 / 还原 |
| `Ctrl+z` + `c` / `n` / `p` | 新建 / 下一个 / 上一个 tab |
| `Alt+1..9` | 切到第 N 个 tab |
| `Ctrl+z` + `Ctrl+s` | 保存当前面板输出到 `~/herdr-captures/` |
| `Ctrl+z` + `?` | herdr 内置键位帮助 |

## 目录树

```text
herdr-config/
├── herdr/
│   ├── config.toml               herdr 主配置（全量显式键位）
│   ├── scripts/capture-pane.sh   存面板输出
│   ├── patches/navigate.sh.txt   导航插件补丁（ctrl+hjkl → alt+方向键）
│   └── README.md                 完整键位表 / 原理 / 取舍
├── nvim/
│   ├── init.vim                  archvim 入口
│   ├── lua/archvim/              配置源码（不含 predownload/）
│   ├── plugin/packer_compiled.lua
│   ├── scripts/                  archvim 自带的安装/说明脚本
│   ├── after/plugin/herdr-navigation.lua   nvim 侧导航（边缘穿越 / 环绕）
│   └── README.md                 装法、改了什么、和 herdr 怎么配合
├── tmux/
│   ├── tmux.conf                 老 tmux 配置
│   └── README.md                 键位备注
├── install.sh                    分块安装（herdr / nvim / tmux）
└── .gitattributes                强制 LF
```

## 说明

- 只收**手写的配置源码**，插件本体、缓存、二进制一律不进仓库。
- `install.sh` 覆盖前会备份（`~/.config/nvim.bak.<时间戳>`、`~/.tmux.conf.bak.<时间戳>`）。
- 这台机器的实际状态：WSL Ubuntu-20.04 + WezTerm；herdr 配置已生效，nvim 是 archvim、插件在本地 `predownload/`。
