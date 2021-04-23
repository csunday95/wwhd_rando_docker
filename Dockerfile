from devkitpro/devkitppc

COPY wut /wut
COPY build.sh /build.sh

RUN cd /wut && make && make install && rm -rf /wut

VOLUME /src
WORKDIR /src

CMD ["/bin/bash", "/build.sh"]
