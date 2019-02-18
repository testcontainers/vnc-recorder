# vnc-recorder
#
# VERSION	0.1

FROM debian:stretch-slim as build_image

RUN apt-get update && apt-get install -y \
  python-pip python-dev \
  && rm -rf /var/lib/apt/lists/*

RUN pip install pyinstaller
RUN pip install vnc2flv

RUN PYTHONOPTIMIZE=1 pyinstaller --onedir --distpath /tmp/flvrec /usr/local/bin/flvrec.py

FROM debian:stretch-slim
MAINTAINER Richard North <rich.north@gmail.com>

LABEL Description="This image can be used to create a sidekick container for recording videos of VNC sessions hosted in other containers"

COPY --from=build_image /tmp/flvrec /usr

ENTRYPOINT ["/usr/flvrec/flvrec"]
CMD ["--help"]
