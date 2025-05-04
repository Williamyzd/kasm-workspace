FROM registry.cn-hangzhou.aliyuncs.com/reg_pub/python:3.11.9-slim
USER root
ENV UV_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple
ENV EXTRA_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple
# 调整环境变量定义顺序
ENV WEB_DIR=/home/kasm-user/web
ENV BROWER_USER_DIR=/home/kasm-user/web/brower-user-dir  
ENV WEB_PYTHON_ENV=/home/kasm-user/web/mcp-env

RUN mkdir -p $WEB_DIR && \
    mkdir -p  $BROWER_USER_DIR && \
    mkdir -p  $WEB_DIR/log 
    
COPY start.sh $WEB_DIR/
COPY config.json $WEB_DIR/
COPY setup_20.x $WEB_DIR/nodesource_setup.sh
CMD [ "tail", "-f", "/dev/null" ]
