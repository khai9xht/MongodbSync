docker-compose exec mongodb bash -c '/usr/local/bin/init-PersonRepresentation.sh'
docker-compose exec kafka bash -c 'bin/kafka-topics.sh --create --topic Person --bootstrap-server kafka:7395' 
# --partitions 3 --replication-factor 2
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://192.168.50.17:8084/connectors/ -d @mongodb-source.json