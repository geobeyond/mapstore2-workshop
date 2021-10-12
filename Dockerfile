FROM geosolutionsit/mapstore2:2021.01.04

run apt-get update && apt-get -y install maven
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - 
RUN apt-get install -y nodejs


workdir /srv
run wget https://github.com/cdr/code-server/releases/download/v3.12.0/code-server-3.12.0-linux-amd64.tar.gz
run tar xf code-server-3.12.0-linux-amd64.tar.gz

run mkdir /usr/lib/code-server
run cp -r /srv/code-server-3.12.0-linux-amd64/* /usr/lib/code-server/
run ln -s /usr/lib/code-server/code-server /usr/bin/code-server

workdir /root
run wget https://github.com/geosolutions-it/MapStore2/archive/refs/tags/v2021.01.04.zip
run unzip v2021.01.04.zip
workdir /root/MapStore2-2021.01.04

ENV PASSWORD=ispra21
cmd ["/usr/bin/code-server", "--bind-addr", "0.0.0.0:9080"]