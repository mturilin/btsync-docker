FROM ubuntu:14.04

MAINTAINER Mikhail Turilin
# installing prerequisites
RUN apt-get update && apt-get install -y curl

# downloading bt sync
RUN curl -o /usr/bin/btsync.tar.gz https://download-cdn.getsyncapp.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz
RUN cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz

# copying configuration
COPY btsync.conf /etc/btsync.conf

# copying prerun file
COPY btsync-prerun.sh /usr/bin/btsync-prerun.sh
RUN chmod +x /usr/bin/btsync-prerun.sh

EXPOSE 8888
EXPOSE 55555

CMD /usr/bin/btsync-prerun.sh && btsync --config /etc/btsync.conf --nodaemon