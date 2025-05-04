#!/bin/bash
nohup npx -y @playwright/mcp@latest --port 8002   > logs/playwright.log 2>&1 &
sleep 10 
nohup mcpo --port 8001 --config mcps/config.json > logs/mcp.log 2>&1 &
# tail -f  logs/mcp.log
