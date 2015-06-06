FROM ubuntu:14.04

MAINTAINER Mikhail Turilin
# installing prerequisites
RUN apt-get update && apt-get install -y curl python-pip
RUN pip install j2cli

# downloading bt sync
RUN curl -o /usr/bin/btsync.tar.gz https://download-cdn.getsyncapp.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz
RUN cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz

# copying configuration
COPY btsync.conf.j2 /root/

# copying prerun file
COPY config.sh /usr/bin/config.sh
RUN chmod +x /usr/bin/config.sh

#EXPOSE 8888
#EXPOSE 55555

CMD /usr/bin/config.sh && btsync --config /etc/btsync.conf --nodaemon