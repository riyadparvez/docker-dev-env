
FROM ubuntu:14.04
MAINTAINER Riyad Parvez <riyad.parvez@gmail.com>

ADD setup-dev-env.sh /
RUN chmod +x setup-dev-env.sh
RUN /setup-dev-env.sh

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

ENV NEWUSER riyad
#ENV NEWPASS nothingelsematters

RUN useradd -m $NEWUSER
RUN adduser $NEWUSER sudo

# Setup home directory
USER riyad
WORKDIR /home/riyad
ENV HOME /home/riyad

# Open a port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
