FROM loupe-base:latest

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt -y install lua5.2
ARG DEBIAN_FRONTEND=interactive

COPY dockerfile_data/lua-test.sh /root/lua-test.sh
COPY dockerfile_data/hello.lua /root/hello.lua
RUN chmod a+x /root/lua-test.sh

CMD /root/explore.py --output-csv --test-sequential -t /root/lua-test.sh --disable-static -b /usr/bin/lua -- /root/hello.lua