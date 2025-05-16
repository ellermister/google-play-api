# 使用 Node.js 官方镜像作为基础镜像
FROM node:18-alpine

# 添加构建参数
ARG DOCKER_IMAGE_NAME=google-play-api
ARG DOCKER_IMAGE_TAG=latest

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json（如果存在）
COPY package*.json ./

# 安装依赖
RUN npm install

# 复制源代码
COPY . .

# 暴露端口
EXPOSE 3000

# 启动应用
CMD ["npm", "start"]

# 设置镜像标签
LABEL org.opencontainers.image.source="https://github.com/${DOCKER_IMAGE_NAME}"
LABEL org.opencontainers.image.description="Google Play API Service"
LABEL org.opencontainers.image.version="${DOCKER_IMAGE_TAG}"
