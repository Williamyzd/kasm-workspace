from playwright.sync_api import sync_playwright
import time
import argparse
import os

def run(port=9222, url="https://www.baidu.com"):
    with sync_playwright() as p:
        # 创建用户数据目录
        
        browser = p.chromium.launch(
            headless=False,
            args=[
                f"--remote-debugging-port={port}"
                
            ]
        )
    
        print(f"浏览器服务已启动，监听端口：{port}")
        context = browser.new_context()
        page = context.new_page()
        page.goto(url)
        print(f"已访问：{url}")
        try:
            while True:
                time.sleep(1)
        except KeyboardInterrupt:
            page.close()
            context.close()
            browser.close()
            print("\n服务已关闭")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='启动带参数的浏览器服务')
    parser.add_argument('--port', type=int, default=9222)
    parser.add_argument('--url', type=str, default="https://www.baidu.com")
    args = parser.parse_args()
    
    run(port=args.port, url=args.url)