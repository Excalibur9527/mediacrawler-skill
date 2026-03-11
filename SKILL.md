---
name: media-crawler
description: 基于 MediaCrawler 的多平台公开信息采集工具，支持小红书、抖音、B站等平台的关键词搜索和评论抓取。
---

# MediaCrawler

基于 [MediaCrawler](https://github.com/NanmiCoder/MediaCrawler.git) 的多平台公开信息采集工具。

## 支持平台

- 小红书（xhs）
- 抖音
- 快手
- B站
- 微博
- 贴吧
- 知乎

## 功能特性

- 关键词搜索采集
- 指定帖子/内容 ID 采集
- 评论/二级评论抓取
- 登录态缓存
- 代理支持
- WebUI 启动
- 多种数据存储（CSV, JSON, JSONL, Excel, SQLite, MySQL）

## Usage

### 安装环境

```bash
bash scripts/setup.sh
```

或手动执行：

```bash
# 1. 克隆项目
git clone https://github.com/NanmiCoder/MediaCrawler.git "$PROJECT_PATH"

# 2. 安装依赖
cd "$PROJECT_PATH"
uv sync

# 3. 安装 Playwright 浏览器驱动
uv run playwright install chromium
```

### 查看帮助

```bash
cd "$PROJECT_PATH"
uv run main.py --help
```

### 运行采集

**小红书 - 关键词搜索抓取：**

```bash
uv run main.py --platform xhs --lt qrcode --type search
```

**小红书 - 指定帖子详情抓取：**

```bash
uv run main.py --platform xhs --lt qrcode --type detail
```

### 启动 WebUI

```bash
uv run uvicorn api.main:app --port 8080 --reload
```

访问 http://localhost:8080

## 参数说明

- `--platform`：目标平台（xhs, dy, kuaishou, bilibili, weibo, tieba, zhihu）
- `--lt`：登录方式（qrcode-二维码登录, cookie-Cookie登录）
- `--type`：采集类型（search-搜索采集, detail-详情采集）

## 配置

编辑 `config/base_config.py` 配置：
- 平台选择
- 关键词配置
- 指定帖子 ID 列表
- 登录配置
- 数据保存配置
- 代理配置

## 前置依赖

- uv
- Node.js (>= 16.0.0)
- Git
- Playwright 浏览器驱动

## 注意事项

- **仅供学习和研究使用**
- **禁止用于非法用途或侵犯他人合法权益**
- **禁止用于商业化违规爬取**
- **执行前应确认目标行为合法合规**
