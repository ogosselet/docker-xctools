FROM centos:7

ADD startup /code

WORKDIR /code

# RUN rpm -vih https://download.postgresql.org/pub/repos/yum/$PG_VERSION/redhat/rhel-7-x86_64/pgdg-centos$PGVERSION-$PG_VERSION-2.noarch.rpm && \
RUN yum update -y && \
    yum install -y https://centos7.iuscommunity.org/ius-release.rpm && \
    yum install -y gcc python36u python36u-pip python36u-devel git zsh wget figlet vim && \
    pip3.6 install --upgrade pip && \ 
    yum clean all && \
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true && \
    cp /code/zshrc /root/.zshrc && \
    ln -s /usr/bin/python3.6 /usr/bin/python3 && \
    touch /root/.z

RUN pip3 install --no-cache-dir -r /code/requirements.txt

ENV PATH "$PATH:/code/xctools/"

CMD ["/usr/bin/zsh"]
