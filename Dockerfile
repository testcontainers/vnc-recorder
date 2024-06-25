# vnc-recorder
#
# VERSION	0.1

FROM debian:bookworm-slim

LABEL Description="This image can be used to create a sidekick container for recording videos of VNC sessions hosted in other containers"
LABEL maintainer="Richard North <rich.north@gmail.com>"

RUN apt-get update && apt-get install -y \
  python3-pip python-dev ffmpeg \
  && rm -rf /var/lib/apt/lists/* \
  && pipx install vnc2flv3 \
  && rm -fr /tmp/*

ENTRYPOINT ["flvrec.py"]
CMD ["--help"]
