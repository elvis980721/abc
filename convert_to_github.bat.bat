@echo off
setlocal

echo ====================================
echo 🚀 Unity Plastic SCM 專案轉 GitHub 工具
echo ====================================

:: 確認當前資料夾
echo 📂 當前路徑：%cd%
set /p confirm="請確認這是 Unity 專案根目錄 (y/n): "
if /i "%confirm%" NEQ "y" (
    echo ❌ 取消操作
    exit /b
)

:: 刪除 .plastic
if exist ".plastic" (
    echo 🗑 刪除 .plastic 資料夾...
    rmdir /s /q ".plastic"
)

:: 建立 .gitignore
echo ✍ 建立 Unity 專用 .gitignore...
(
echo # Unity
echo [Ll]ibrary/
echo [Tt]emp/
echo [Oo]bj/
echo [Bb]uild/
echo [Bb]uilds/
echo [Ll]ogs/
echo [Mm]emoryCaptures/
echo
echo # OS generated files
echo .DS_Store
echo Thumbs.db
echo
echo # Visual Studio
echo .vs/
echo *.csproj
echo *.sln
echo *.user
echo *.unityproj
echo *.pidb
echo *.booproj
) > ".gitignore"

:: 初始化 Git
echo 🔄 初始化 Git...
git init
git add .
git commit -m "Initial commit from Plastic SCM"

:: 輸入 GitHub Repo URL
set /p repoURL="請輸入 GitHub Repository URL: "

:: 設定遠端並推送
git remote add origin %repoURL%
git branch -M main
git push -u origin main

echo ✅ 專案已成功轉移到 GitHub！
pause
