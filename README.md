# Docker 部署前端项目，简单版学习

## 华为osb 云服务，静态资源部署

上传工具的sdk, github 地址： https://github.com/huaweicloud/huaweicloud-sdk-nodejs-obs

npm i esdk-obs-nodejs


### docker 操作
进入docker容器中：
docker exec -it <容器id> /bin/sh

docker查看容器的运行位置以及所在位置:
docker inspect <容器id>

docker 编译查看编译日志细节 --progress plain
docker build -f xxx.Dockerfile --progress plain --no-cache .

export OBS_ACCESS_KEY_ID=F56JREE2FUX3PFZ5SAVP
export OBS_SECRET_ACCESS_KEY=HRrRJZT9YXJOVXa3GiGyW0GYRo0vXhHYRrDLtwiS

删除所有容器
docker rm `docker ps -a -q`

删除所有镜像
docker rmi `docker images -q`

删除所有没有tag的镜像
docker rmi `docker images|grep none|awk '{print $3 }'|xargs`


