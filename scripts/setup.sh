#!/bin/bash

# 獲取腳本所在目錄的父目錄（項目根目錄）
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
# 前端版本庫位置
FRONTEND_REPO="https://github.com/leadingtw273/game-trading-matchmaking-frontend.git"
# 後端版本庫位置
BACKEND_REPO="https://github.com/leadingtw273/game-trading-matchmaking-backend.git"

# 設定顏色
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# 顯示標題
echo -e "${GREEN}=== 初始化 ===${NC}"

# 確認當前目錄
echo -e "${YELLOW}項目根目錄: $PROJECT_ROOT${NC}"

# 創建資料夾
echo -e "${GREEN}創建資料夾...${NC}"
mkdir -p "$PROJECT_ROOT/frontend" "$PROJECT_ROOT/backend"
echo -e "${GREEN}資料夾創建成功${NC}"

# Clone 相關的版本庫
echo -e "${GREEN}克隆版本庫...${NC}"

# 克隆前端版本庫
echo -e "${YELLOW}克隆前端版本庫...${NC}"
git clone "$FRONTEND_REPO" "$PROJECT_ROOT/frontend"
if [ $? -eq 0 ]; then
    echo -e "${GREEN}前端版本庫克隆成功${NC}"
else
    echo -e "${RED}前端版本庫克隆失敗${NC}"
fi

# 安裝前端依賴
echo -e "${YELLOW}安裝前端依賴...${NC}"
cd "$PROJECT_ROOT/frontend"
pnpm install
if [ $? -eq 0 ]; then
    echo -e "${GREEN}前端依賴安裝成功${NC}"
else
    echo -e "${RED}前端依賴安裝失敗${NC}"
fi

# 克隆後端版本庫
echo -e "${YELLOW}克隆後端版本庫...${NC}"
git clone "$BACKEND_REPO" "$PROJECT_ROOT/backend"
if [ $? -eq 0 ]; then
    echo -e "${GREEN}後端版本庫克隆成功${NC}"
else
    echo -e "${RED}後端版本庫克隆失敗${NC}"
fi

# 安裝後端依賴
echo -e "${YELLOW}安裝後端依賴...${NC}"
cd "$PROJECT_ROOT/backend"
pnpm install
if [ $? -eq 0 ]; then
    echo -e "${GREEN}後端依賴安裝成功${NC}"
else
    echo -e "${RED}後端依賴安裝失敗${NC}"
fi

echo -e "${GREEN}=== 初始化完成 ===${NC}"