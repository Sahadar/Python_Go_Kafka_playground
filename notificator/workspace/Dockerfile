FROM python:3.7.2-stretch

VOLUME /usr/src/playground

WORKDIR /root

RUN apt-get update \
	&& apt-get install -y \
		vim \
		sudo \
	&& apt-get clean all

ENV TERM xterm

RUN adduser playground -u 1000 -home /home/playground --shell /bin/bash --disabled-password --gecos ""
RUN adduser playground sudo

COPY ./.bashrc /home/playground/.bashrc
COPY ./container_run.sh /run.sh
COPY ./.vimrc /home/playground/.vimrc

RUN chown playground:playground /home/playground/.bashrc
RUN chown playground:playground /home/playground/.vimrc

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN pip install boto3 \
	&& pip install kafka-python

COPY ./.bashrc /root/.bashrc

VOLUME /home/playground/.aws
WORKDIR /usr/src/playground

USER playground
CMD ["/run.sh"]