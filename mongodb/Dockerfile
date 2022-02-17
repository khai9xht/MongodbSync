FROM mongo:3.6

LABEL maintainer="Debezium Community"

COPY init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init.sh

CMD ["mongod", "--replSet", "rs0", "--auth"]