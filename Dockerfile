FROM alpine:3.10.3
ADD ./jre-8u231-linux-x64.tar.gz /usr/local/
RUN echo http://mirrors.aliyun.com/alpine/v3.10/main > /etc/apk/repositories && \
echo http://mirrors.aliyun.com/alpine/v3.10/community >> /etc/apk/repositories
RUN apk update && apk upgrade
RUN apk --no-cache add ca-certificates wget
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-2.30-r0.apk
RUN apk add glibc-2.30-r0.apk
ENV JAVA_HOME=/usr/local/jdk1.8.0_172
ENV CLASSPATH=$JAVA_HOME/bin
ENV PATH=.:$JAVA_HOME/bin:$PATH
CMD ["java","-version"]