-- WezTerm 配置：中文 Windows 乱码修复
-- wezterm 以 UTF-8 解码子进程输出；PowerShell 5.1 默认 GBK 输出会导致中文乱码，
-- 配合 profile.ps1 里的 UTF-8 设置一起生效。
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = { 'pwsh.exe', '-NoLogo' }
-- 减少缺字形警告弹窗（中文走 DirectWrite 回退，属正常）
config.warn_about_missing_glyphs = false

return config
