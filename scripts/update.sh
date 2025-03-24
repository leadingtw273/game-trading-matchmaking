#!/bin/bash

# 獲取腳本所在目錄的父目錄（項目根目錄）
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

# 設定顏色
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# 顯示標題
echo -e "${GREEN}=== 更新版本庫 ===${NC}"

# 確認當前目錄
echo -e "${YELLOW}項目根目錄: $PROJECT_ROOT${NC}"

# 檢查前端目錄是否存在
if [ -d "$PROJECT_ROOT/frontend" ]; then
    echo -e "${GREEN}更新前端代碼...${NC}"
    cd "$PROJECT_ROOT/frontend"
    git pull
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}前端代碼更新成功${NC}"
    else
        echo -e "${RED}前端代碼更新失敗${NC}"
    fi
    cd "$PROJECT_ROOT"
else
    echo -e "${RED}前端目錄不存在${NC}"
fi

# 檢查後端目錄是否存在
if [ -d "$PROJECT_ROOT/backend" ]; then
    echo -e "${GREEN}更新後端代碼...${NC}"
    cd "$PROJECT_ROOT/backend"
    git pull
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}後端代碼更新成功${NC}"
    else
        echo -e "${RED}後端代碼更新失敗${NC}"
    fi
    cd "$PROJECT_ROOT"
else
    echo -e "${RED}後端目錄不存在${NC}"
fi

# 覆蓋環境變數
echo -e "${GREEN}覆蓋環境變數...${NC}"

# 覆蓋前端環境變數
if [ -f "$PROJECT_ROOT/.env.frontend" ] && [ -f "$PROJECT_ROOT/frontend/.env.local" ]; then
    cp -f "$PROJECT_ROOT/.env.frontend" "$PROJECT_ROOT/frontend/.env.local"
    echo -e "${GREEN}前端環境變數已覆蓋${NC}"
elif [ ! -f "$PROJECT_ROOT/.env.frontend" ]; then
    echo -e "${RED}前端 .env.frontend 文件不存在${NC}"
else
    echo -e "${YELLOW}前端 .env 文件不存在，創建新文件${NC}"
    cp "$PROJECT_ROOT/.env.frontend" "$PROJECT_ROOT/frontend/.env.local"
fi

# 覆蓋後端環境變數
if [ -f "$PROJECT_ROOT/.env.backend" ] && [ -f "$PROJECT_ROOT/backend/.env.local" ]; then
    cp -f "$PROJECT_ROOT/.env.backend" "$PROJECT_ROOT/backend/.env.local"
    echo -e "${GREEN}後端環境變數已覆蓋${NC}"
elif [ ! -f "$PROJECT_ROOT/.env.backend" ]; then
    echo -e "${RED}後端 .env.backend 文件不存在${NC}"
else
    echo -e "${YELLOW}後端 .env 文件不存在，創建新文件${NC}"
    cp "$PROJECT_ROOT/.env.backend" "$PROJECT_ROOT/backend/.env.local"
fi

echo -e "${GREEN}=== 操作完成 ===${NC}"
