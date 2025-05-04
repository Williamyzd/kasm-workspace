#!/usr/bin/env bash
nohup npx -y @playwright/mcp@latest --port 8002 --executable-path /usr/bin/chromium --user-data-dir ${BROWER_USER_DIR}   >  ${WEB_DIR}/log/playwright-mcp.log 2>&1 &
# nohup npx -y @playwright/mcp@latest --port 8002  --user-data-dir ${BROWER_USER_DIR}   >  ${WEB_DIR}/log/playwright-mcp.log 2>&1 &

sleep 5
nohup $WEB_PYTHON_ENV/bin/python $WEB_PYTHON_ENV/bin/mcpo --port 8001 --config ${MCP_CONFIG}/config.json > ${WEB_DIR}/log/mcp.log 2>&1 &
# tail -f   /var/log/mcp.log
