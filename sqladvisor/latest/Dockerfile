FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install wget -y
RUN wget https://repo.percona.com/apt/percona-release_0.1-4.xenial_all.deb
RUN dpkg -i percona-release_0.1-4.xenial_all.deb

RUN apt-get update && apt-get install git cmake  libaio-dev libffi-dev libglib2.0  libglib2.0-dev libperconaserverclient18.1-dev -y

RUN git clone --depth=1 https://github.com/Meituan-Dianping/SQLAdvisor.git

WORKDIR /SQLAdvisor
RUN cmake -DBUILD_CONFIG=mysql_release -DCMAKE_BUILD_TYPE=debug -DCMAKE_INSTALL_PREFIX=/usr/local/sqlparser  ./ \
	&& make \
	&& make install

WORKDIR /SQLAdvisor/sqladvisor
RUN echo "include_directories(\"/usr/lib/x86_64-linux-gnu/glib-2.0/include\")" >> CMakeLists.txt \
	&& cmake -DCMAKE_BUILD_TYPE=debug ./ \
	&& make \
	&& ln -s /SQLAdvisor/sqladvisor/sqladvisor /bin/sqladvisor

ENTRYPOINT ["sqladvisor"]
