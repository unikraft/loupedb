FROM loupe-base:latest

RUN apt update
RUN apt install -y lua5.2

COPY dockerfile_data/lua-test.sh /root/lua-test.sh
COPY dockerfile_data/hello.lua /root/hello.lua
RUN chmod a+x /root/lua-test.sh

CMD /root/explore.py --output-csv --test-sequential -t /root/lua-test.sh --timeout 10 -b /usr/bin/lua -- /root/hello.lua