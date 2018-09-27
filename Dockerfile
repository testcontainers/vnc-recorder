# vnc-recorder
#
# VERSION	0.1

FROM debian:jessie
MAINTAINER Richard North <rich.north@gmail.com>

LABEL Description="This image can be used to create a sidekick container for recording videos of VNC sessions hosted in other containers"

RUN apt-get update && apt-get install -y \
  python-pip python-dev \
  && rm -rf /var/lib/apt/lists/*

RUN pip install vnc2flv

ENTRYPOINT ["flvrec.py"]
CMD ["--help"]
