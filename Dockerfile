## 引入最新的golang ，不设置版本即为最新版本
FROM golang
## 在docker的根目录下创建相应的使用目录
RUN mkdir -p /www/webapp
## 设置程序在容器内的工作路径
WORKDIR /www/webapp
COPY . /www/webapp
## 编译
#RUN go build .
## 暴露容器内部端口
EXPOSE 9090
## 启动docker需要执行的文件
CMD go run main.go