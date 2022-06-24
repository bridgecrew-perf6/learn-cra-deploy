FROM node:14-alpine as builder

ARG ACCESS_KEY_ID
ARG ACCESS_KEY_SECRET
ARG ENDPOINT
ENV PUBLIC_URL zengxin-source.obs.cn-south-1.myhuaweicloud.com

WORKDIR /code

# 为了更好的缓存，把它放在前边
# 这一步是根据华为云obs相关文档，下载obsutil,并配置key,secret等信息到环境变量
RUN wget http://obs-community.obs.cn-north-1.myhuaweicloud.com/obsutil/current/obsutil_linux_amd64.tar.gz -P /usr/local/bin \
    && tar -xzvf /usr/local/bin/obsutil_linux_amd64.tar.gz
    # && chmod 755 /usr/local/bin/obsutil_linux_amd64_5.3.4 \
    # && obsutil config -i $ACCESS_KEY_ID -k $ACCESS_KEY_SECRET -e $ENDPOINT 

RUN ls

# 单独分离 package.json，是为了安装依赖可最大限度利用缓存
# ADD package.json yarn.lock /code/
# RUN yarn

# ADD . /code
# RUN npm run build && npm run obs:cli

# 选择更小体积的基础镜像
# FROM nginx:alpine
# ADD nginx.conf /etc/nginx/conf.d/default.conf
# COPY --from=builder code/build /usr/share/nginx/html
