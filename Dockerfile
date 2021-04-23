from devkitpro/devkitppc

COPY wut /wut

RUN cd /wut && make && make install && rm -rf /wut

VOLUME /src
WORKDIR /src

ENTRYPOINT /bin/bash
