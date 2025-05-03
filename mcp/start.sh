#!/bin/bash
# 检查日志目录是否存在

# nohup  python3 $WEB_DIR/start_chrome.py --port 8000 > $WEB_DIR/log/brower.log 2>&1 &

nohup npx -y @playwright/mcp@latest --port 8002 --executable-path /usr/bin/chromium --user-data-dir ${BROWER_USER_DIR}   >  ${WEB_DIR}/log/playwright-mcp.log 2>&1 &
sleep 5
. $WEB_PYTHON_ENV/bin/activate
nohup mcpo --port 8001 --config ${WEB_DIR}/config.json > ${WEB_DIR}/log/mcp.log 2>&1 &
# tail -f   /var/log/mcp.log
