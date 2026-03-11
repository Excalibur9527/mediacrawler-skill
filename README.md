# MediaCrawler Automation

基于 [MediaCrawler](https://github.com/NanmiCoder/MediaCrawler.git) 的多平台公开信息采集安装型 skill。

## 这个 skill 做什么

- 自动检测 `git`
- 自动检测并安装 `uv`
- 从 GitHub 拉取或更新 MediaCrawler 项目
- 执行 `uv sync`
- 安装 Playwright Chromium
- 执行一次健康检查，确认主程序可以启动

> 注意：本 skill 当前聚焦 **安装与命令行运行**，不再默认提供 WebUI 启动命令，避免与上游仓库结构不一致导致报错。

## 默认项目目录

默认安装到：

```bash
$HOME/MediaCrawler
```

也可以通过环境变量覆盖：

```bash
PROJECT_PATH=/your/path/to/MediaCrawler
bash scripts/setup.sh
```

## 安装

```bash
bash scripts/setup.sh
```

## 安装脚本行为

脚本会依次执行：

1. 检查 `git`
2. 检查 `uv`，若缺失则尝试自动安装
3. 克隆项目；若目录已存在且是正确仓库，则执行 `git pull --ff-only`
4. 执行 `uv sync`
5. 安装 Playwright Chromium
6. 执行 `uv run main.py --help` 做健康检查

## 使用方法

### 查看帮助

```bash
cd "$PROJECT_PATH"
uv run main.py --help
```

### 运行主程序

```bash
cd "$PROJECT_PATH"
uv run main.py
```

### 示例：小红书关键词搜索

```bash
cd "$PROJECT_PATH"
uv run main.py --platform xhs --lt qrcode --type search
```

## 预定义命令

| 命令 | 说明 |
|------|------|
| `crawler-init` | 初始化环境（检查环境、拉取仓库、安装依赖、安装浏览器） |
| `crawler-help` | 查看主程序帮助 |
| `crawler-run` | 运行主程序 |

## 合规声明

- 仅供学习和研究使用
- 禁止用于非法用途或侵犯他人合法权益
- 执行前请确认目标行为合法合规
