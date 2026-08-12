# 部署說明

這是一個簡單的靜態網站部署方案，針對 `捉鬼BGM` 資料夾中的 `index.html` 和音訊檔案。

## 推薦方式：GitHub Pages

### 步驟
1. 在 GitHub 上建立一個新的 repository，例如 `zhuogui-bgm`。
2. 把 repo URL 設成一個環境變數：
   ```sh
   export GITHUB_REPO=https://github.com/yourname/zhuogui-bgm.git
   ```
3. 在 `捉鬼BGM` 資料夾內執行：
   ```sh
   sh deploy-github-pages.sh
   ```
4. 到 GitHub repository 的 `Settings > Pages`，把 GitHub Pages 設定為 `Branch: main`、`Folder: /`。
5. 等待 GitHub Pages 部署完成，然後使用分頁提供的網址訪問。

### 注意
- 這個資料夾內含音訊檔案，repo 會把它們一起上傳。若你希望減少 repo 大小，可先移除大型音訊資料夾，再另行使用外部檔案伺服器。
- 如果你沒有 GitHub CLI，這個腳本仍可運作，會使用系統中的 git 指令。

## 可選方式：Cloudflare Pages

如果你已經在 Cloudflare Pages 上有帳號，也可以：
1. 建立一個新的 Pages 專案。
2. 將 `捉鬼BGM` 資料夾同步到 GitHub 之後，連到 GitHub 專案。
3. Pages 自動部署時，`Build command` 留空，`Build output directory` 設為 `/`。

## 本機測試
如果你只想在自己的電腦測試，可用 Python 啟動本機伺服器：
```sh
cd /Users/mo/Desktop/捉鬼BGM
python3 -m http.server 8000
```
然後瀏覽 `http://localhost:8000`。
