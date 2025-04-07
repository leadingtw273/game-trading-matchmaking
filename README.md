# game-trading-matchmaking

### 需求
- docker

### 安裝
  ``` bash
  chmod +x ./scripts/*.sh # 設置腳本權限
  ./scripts/setup.sh # 執行設置腳本
  ```

### 執行
  - 啟動
    ``` bash
    docker-compose up
    docker-compose up -d # 非互動模式，背景執行
    ```
  - 停止
    ``` bash
      docker-compose down
      docker-compose down -v # 清除資料
    ```

### 端口
  - 前端: http://localhost:5173
  - 後端: http://localhost:3000
  - 資料庫 http://localhost:5432
  - pgadmin http://localhost:5050