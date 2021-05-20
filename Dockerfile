from devkitpro/devkitppc

COPY wut /wut
COPY libiosuhax /libiosuhax
COPY build.sh /build.sh

RUN cd /wut && make && make install && rm -rf /wut
RUN cd /libiosuhax && make && make install && rm -rf /libiosuhax
# hack to put the include/lib file into DKP/wut's native search directories
RUN mv /opt/devkitpro/wut/usr/lib/* /opt/devkitpro/wut/lib/stubs/ && \
    mv /opt/devkitpro/wut/usr/include/* /opt/devkitpro/wut/include/

VOLUME /src
WORKDIR /src

CMD ["/bin/bash", "/build.sh"]
