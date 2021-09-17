FROM debian:buster

RUN apt update && apt install --yes wget curl apt-transport-https ca-certificates wget dirmngr gnupg software-properties-common && \
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - && \
    add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ && \
    apt update && apt install --yes adoptopenjdk-8-hotspot && update-alternatives --config java

RUN wget https://dlcdn.apache.org/hbase/2.4.6/hbase-2.4.6-bin.tar.gz && \
    tar xzvf hbase-2.4.6-bin.tar.gz && mv hbase-2.4.6 /root/hbase && \
    rm -rf hbase-2.4.6-bin.tar.gz && rm -rf /root/hbase/conf && \
    rm -rf /root/hbase/docs

ADD conf /root/hbase/conf
ADD runner.bash /root/hbase/runner.bash

WORKDIR /root/hbase

EXPOSE 16010 16000 16020 16030 8080 8085 9090 9095

CMD ["./runner.bash"]
