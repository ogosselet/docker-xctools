FROM centos:7

ADD startup /code

WORKDIR /code

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

ENV XCTOOLS_VERSION_TAG v0.0.1

RUN git clone https://github.com/ogosselet/xctools.git xctools && \
    git --git-dir xctools/.git --work-tree=xctools checkout tags/$XCTOOLS_VERSION_TAG

ENV PATH "$PATH:/code/xctools/"

CMD ["/usr/bin/zsh"]
