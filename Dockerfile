FROM mame-build:latest
MAINTAINER sairuk

ARG EMSCRIPTEN_VERSION=3.1.25
ARG SUBTARGET=c64p
ARG SOURCES=src/mame/c64p.cpp
ARG USER=emudev
ARG UID=1004
ARG BS=build-script
ARG BSD=/home/${USER}/${BS}

RUN cd /opt/app \ 
    && git clone https://github.com/emscripten-core/emsdk.git \
    && cd emsdk \
    && git pull \
    && ./emsdk install ${EMSCRIPTEN_VERSION}

VOLUME /home/${USER}
WORKDIR /home/${USER}
USER ${USER}


ENTRYPOINT /home/emudev/build-script
