FROM node:carbon-alpine

RUN echo "http://mirrors.aliyun.com/alpine/v3.6/main/" > /etc/apk/repositories
RUN apk update && apk add python make tzdata \
    && rm -f /etc/localtime \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /opt/app
WORKDIR /opt/app
COPY index.js package.json .

RUN npm config set registry https://registry.npm.taobao.org

EXPOSE 3000
VOLUME [ "/opt/app" ]

CMD [ "npm", "start" ]