from devkitpro/devkitppc

COPY wut /wut
COPY libiosuhax /libiosuhax
COPY build.sh /build.sh

# dos2unix build script in case we did a windows build and they have CR endings
RUN apt update && apt install -y dos2unix && dos2unix /build.sh && apt-get --purge remove -y dos2unix && rm -rf /var/lib/apt/lists/*

# build latest wut from source
RUN cd /wut && make && make install && rm -rf /wut
RUN cd /libiosuhax && make && make install && rm -rf /libiosuhax
# hack to put the include/lib file into DKP/wut's native search directories
RUN mv /opt/devkitpro/wut/usr/lib/* /opt/devkitpro/wut/lib/stubs/ && \
    mv /opt/devkitpro/wut/usr/include/* /opt/devkitpro/wut/include/

VOLUME /src
WORKDIR /src

CMD ["/bin/bash", "/build.sh"]
