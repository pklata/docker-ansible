FROM python:3.9.2-buster
MAINTAINER Paweł Klata <pawelklata@gmail.com>

RUN TERM=xterm-256color

RUN apt-get update -qy && \
    apt-get install -qy software-properties-common && \
    apt-get install -qy ansible

# ADD volume for ansible playbooks
VOLUME /ansible
WORKDIR /ansible

ENTRYPOINT ["ansible-playbook"]
CMD ["site.yml"]