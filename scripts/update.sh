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

# 更新前端依賴
echo -e "${GREEN}安裝前端依賴...${NC}"
cd "$PROJECT_ROOT/frontend"
pnpm install

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

# 更新後端依賴
echo -e "${GREEN}安裝後端依賴...${NC}"
cd "$PROJECT_ROOT/backend"
pnpm install

echo -e "${GREEN}=== 操作完成 ===${NC}"
