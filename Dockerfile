# vnc-recorder
#
# VERSION	0.1

FROM debian:10.5-slim

LABEL Description="This image can be used to create a sidekick container for recording videos of VNC sessions hosted in other containers"
LABEL maintainer="Richard North <rich.north@gmail.com>"

RUN apt-get update && apt-get install -y \
  python-pip python-dev ffmpeg \
  && rm -rf /var/lib/apt/lists/* \
  && pip install vnc2flv \
  && rm -fr /tmp/*

ENTRYPOINT ["flvrec.py"]
CMD ["--help"]
