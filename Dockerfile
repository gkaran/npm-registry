# DOCKER-VERSION 1.0.1
# VERSION        2014-06-27
# AUTHOR         Konstantin Burykin <burkostya@gmail.com>
# DESCRIPTION    npm registry
# TO_BUILD       docker build -rm -t npm-registry
# TO_RUN         docker run -p 5984:5984 npm-registry

FROM sameersbn/ubuntu

MAINTAINER burkostya@gmail.com

RUN apt-get install -y python-software-properties && \
        add-apt-repository -y ppa:chris-lea/node.js && \
        apt-get -y update && \
        apt-get install -y nodejs couchdb

# ADD container/setup /app/setup
# RUN chmod 755 /app/setup/install
# RUN /app/setup/install

# ADD container/config/ /app/setup/config/
# ADD container/init    /app/init
# RUN chmod 755 /app/init

# ADD authorized_keys /root/.ssh/


EXPOSE 5984
# EXPOSE 80

VOLUME ["/var/lib/couchdb"]


ENTRYPOINT ["/app/init"]
CMD ["app:start"]