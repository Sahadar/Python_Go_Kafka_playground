FROM python:3.7.2-stretch

VOLUME /usr/src/playground

WORKDIR /root

RUN apt-get update \
	&& apt-get install -y \
		vim \
	&& apt-get clean all

ENV TERM xterm

RUN adduser playground -u 1000 -home /home/playground --shell /bin/bash --disabled-password --gecos ""
COPY ./.bashrc /home/playground/.bashrc
COPY ./.vimrc /home/playground/.vimrc
RUN chown playground:playground /home/playground/.bashrc
RUN chown playground:playground /home/playground/.vimrc

RUN pip install boto3

COPY ./.bashrc /root/.bashrc

VOLUME /home/playground/.aws
WORKDIR /usr/src/playground

USER playground
# CMD ["/run.sh"]