#!/bin/bash
set -e

PROJECT_DIR=$PROJECT_PATH

# 1. 检查并拉取项目
if [ ! -d "$PROJECT_DIR" ]; then
    echo "正在从 GitHub 克隆项目..."
    git clone https://github.com/NanmiCoder/MediaCrawler.git "$PROJECT_DIR"
fi

cd "$PROJECT_DIR"

# 2. 检查 uv 环境
if ! command -v uv &> /dev/null; then
    echo "未检测到 uv，请先安装 uv (curl -LsSf https://astral.sh/uv/install.sh | sh)"
    exit 1
fi

# 3. 部署环境
echo "正在使用 uv 同步依赖..."
uv sync

# 4. 安装 Playwright 浏览器
echo "正在安装 Playwright 驱动..."
uv run playwright install chromium

echo "MediaCrawler 环境部署完成！"