FROM mongo:3.6

LABEL maintainer="Debezium Community"

COPY init-PersonRepresentation.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init-PersonRepresentation.sh

CMD ["mongod", "--replSet", "rs0", "--auth"]