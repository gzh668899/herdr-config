# nvim 配置

[archvim](https://github.com/archibate/vimrc)（分支 `nvim-2`）的配置快照 + 本机的几处改动 + 一个自写的导航脚本。

只管三件事：**保留我习惯的键位**、**记住我对上游改了什么**、**和 herdr 面板无缝连通**。

## 装法

```bash
bash install.sh nvim        # 从仓库根目录跑，会先备份 ~/.config/nvim
```

手动装也行：

```bash
cp -R nvim/init.vim nvim/lua nvim/plugin nvim/scripts nvim/after ~/.config/nvim/
```

**不含插件本体。** 上游会把插件预下载到 `lua/archvim/predownload/`（119MB，`g:archvim_predownload=1` 时离线用），本仓库不收这部分：

- 有网：首次启动 nvim，archvim 会按 `lua/archvim/plugins.lua` 自己拉插件；
- 要离线复现：从上游仓库把 `lua/archvim/predownload/` 补进来即可（`git clone -b nvim-2 https://github.com/archibate/vimrc`）。

## 目录

```text
nvim/
├── init.vim                     入口：require('archvim')，另读 .vim_localrc
├── lua/archvim/
│   ├── init.lua                 依次加载 options → plugins → mappings → custom
│   ├── options.lua              编辑器选项（leader 是 ,）
│   ├── plugins.lua              插件清单与配置
│   ├── mappings.lua             键位映射
│   ├── custom.lua               个人覆盖（配色等）
│   ├── icons.lua                devicons 图标表
│   └── config/                  每个插件一份配置（aerial / bufferline / cmake-tools …）
├── plugin/packer_compiled.lua   packer 编译产物
├── scripts/                     上游自带：装 nvim / 装依赖 / 键位说明
└── after/plugin/
    └── herdr-navigation.lua     本仓库自有：Alt+方向键穿越 herdr 边界
```

## 和上游的差异（就这几处）

| 文件 | 改动 | 为什么 |
|---|---|---|
| `lua/archvim/options.lua` | 加了 `vim._truncated_echo_once = function() return true end` | 静音 nvim 0.12 下插件的 deprecation 屏显（记录仍可用 `:checkhealth vim.deprecated` 看） |
| `lua/archvim/custom.lua` | 配色从 `catppuccin-frappe` 换成 `zephyr` | 个人偏好 |
| `after/plugin/herdr-navigation.lua` | 新增 | 接管 `<A-Left/Down/Up/Right>`，实现跨 herdr 面板的导航 |

其余（`mappings.lua`、`config/` 等）与上游一致。

## 键位习惯（archvim 部分）

| 键 | 作用 |
|---|---|
| `jk` / `kj` | 插入模式回到普通模式（替代 `Esc`） |
| `q` | 保存并关闭当前窗口（原来记宏的 `q`，记宏改用 `Q`） |
| `Alt+←/↓/↑/→` | nvim 分屏内移动；到边缘穿到 herdr 面板，再到头就环绕 |
| `Ctrl+h/j/k/l` | 分屏间移动（archvim 原生，纯 nvim 内够用） |
| `Ctrl+a/e/b/f/n/p` | 插入模式 readline 手感（行首/行尾/退字/进字/下一条/上一条） |
| `F4`–`F10` | 上游给的常用功能键（编译、运行、格式化等） |
| `:Quit` / `ZQ` | 保存退出 / 强制退出 |

详细说明在上游的 `scripts/key_details.md`（已一并收录）。

## 和 herdr 的配合

1. herdr 把 `Alt+方向键` 绑到 [vim-herdr-navigation](https://github.com/paulbkim-dev/vim-herdr-navigation) 插件。
2. 插件用 `jq` 查当前面板前台进程：是 nvim 就把按键转发进来，否则移动 herdr 焦点。
3. 本目录的 `after/plugin/herdr-navigation.lua` 接管进来后的按键：先在 nvim 内 `wincmd`，到边缘用 `herdr pane neighbor` 探邻居——有就 `pane focus --direction` 穿过去，没有就沿反方向一路跳到最远的面板（环绕）。
4. 放在 `after/plugin/` 是因为要**后于** archvim 的 `mappings.lua` 加载，才能覆盖掉它原本的 `Ctrl+hjkl`。

对应 herdr 侧配置与说明见 [`../herdr/README.md`](../herdr/README.md)。
