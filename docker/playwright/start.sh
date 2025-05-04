#!/bin/bash

# 网络连通性测试
if ! ping -c 3 8.8.8.8 &> /dev/null; then
    echo "网络连接失败，请检查容器网络配置"
    exit 1
fi

# DNS解析测试
if ! nslookup google.com &> /dev/null; then
    echo "DNS解析失败，请检查DNS配置"
    exit 1
fi

Xvfb :0 -screen 0 1280x800x16 &  # 启动虚拟X服务器
export DISPLAY=:0
x11vnc -forever -usepw -display :0 -rfbport 5900 &  # 启动VNC服务
chromium-browser --no-sandbox --disable-gpu --start-maximized  # 启动Chromedocker