FROM loupe-base:latest

RUN apt update
RUN apt -y install perl

# Copy test script
COPY dockerfile_data/perl-test.sh /root/perl-test.sh
RUN chmod a+x /root/perl-test.sh

CMD /root/explore.py --output-csv -t /root/perl-test.sh -b /usr/bin/perl -- -v