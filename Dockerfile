FROM openjdk:12-alpine

ENV KOTLIN_VERSION=1.5.0 \
    KOTLIN_HOME=/usr/share/kotlin

RUN apk add --update bash && \
    apk add --virtual=build-dependencies wget ca-certificates && \
    cd /tmp && \
    wget "https://github.com/JetBrains/kotlin/releases/download/v${KOTLIN_VERSION}/kotlin-compiler-${KOTLIN_VERSION}.zip" && \
    unzip "kotlin-compiler-${KOTLIN_VERSION}.zip" && \
    mkdir "${KOTLIN_HOME}" && \
    rm "/tmp/kotlinc/bin/"*.bat && \
    mv "/tmp/kotlinc/bin" "/tmp/kotlinc/lib" "${KOTLIN_HOME}" && \
    ln -s "${KOTLIN_HOME}/bin/"* "/usr/bin/" && \
    ln -s "/usr/local/bin/bash" "/usr/bin/bash" && \
    apk del build-dependencies && \
    rm -rf /tmp/* /var/cache/apk/*
