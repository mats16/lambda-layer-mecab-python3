FROM lambci/lambda:build-python3.6

ARG BASE_DIR=/opt

RUN yum install -y gcc gcc-c++ git patch && \
    rpm -ivh http://packages.groonga.org/centos/groonga-release-1.1.0-1.noarch.rpm && \
    yum -y install perl-App-cpanminus && \
    cpanm autodie

RUN curl -L "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE" | tar zxv -C /tmp && \
    cd /tmp/mecab-0.996 && \
    ./configure --prefix=$BASE_DIR/mecab --enable-utf8-only && \
    make && \
    make install

ENV PATH=$BASE_DIR/mecab/bin:$PATH \
    LD_LIBRARY_PATH=$BASE_DIR/mecab/lib:$LD_LIBRARY_PATH

RUN curl -L "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM" | tar zxv -C /tmp && \
    cd /tmp/mecab-ipadic-2.7.0-20070801 && \
    ./configure --prefix=$BASE_DIR/mecab --enable-utf8-only --with-charset=utf8 && \
    make && \
    make install

RUN pip install mecab-python3==0.996.2 -t $BASE_DIR/python

CMD cp -fr /opt/. /mnt/