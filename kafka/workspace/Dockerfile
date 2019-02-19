FROM openjdk:8-jre-stretch

VOLUME /usr/src/playground

WORKDIR /root

RUN apt-get update \
	&& apt-get install -y \
		vim \
		sudo \
	&& apt-get clean all

ENV TERM xterm
ENV PATH /usr/src/playground/confluent-5.1.1/bin:$PATH

RUN adduser playground -u 1000 -home /home/playground --shell /bin/bash --disabled-password --gecos ""
RUN adduser playground sudo

COPY ./.bashrc /home/playground/.bashrc
COPY ./.vimrc /home/playground/.vimrc
COPY ./container_run.sh /run.sh

RUN chown playground:playground /home/playground/.bashrc
RUN chown playground:playground /home/playground/.vimrc

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY ./.bashrc /root/.bashrc

WORKDIR /usr/src/playground

USER playground
CMD ["/run.sh"]