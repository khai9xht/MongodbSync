## Hướng dẫn khởi tạo và thiết lập mongodb và debezium trong docker
1. Tạo docker file cho mongodb</br>
	Các thông tin cần để tạo mongodb docker nằm trong thư mục mongodb</br>
	Config user/password, database, collection trong file init.sh
</br></br>
2. Config IP, Port, network, ... cho kafka, zookeeper, mongodb, debezium(kafka conect) trong file docker-compose.yaml</br>
	`Note: chỉnh sửa KAFKA_ADVERTISED_LISTENERS trong kafka tương ứng với ip trên máy chủ.`
</br></br>
3. Chạy các container</br>
	Chạy các lệnh commandline sau:</br>
	3.1. Khởi tạo container</br>
		```$ docker compose -up --build```</br>
	3.2. Khởi tạo user, database, collecton trong mongodb container</br>
		```docker-compose exec mongodb bash -c '/usr/local/bin/init.sh'```</br>
	3.3. Khởi tạo trigger check oplog mongodb</br>
		- Config để debezium check mongo database trong file mongodb-source.json. Chỉnh sử IP, Port, database name, collection name, user, password tương ứng với config trong docker-compose.yaml</br>
		- chạy debezium trigger check oplog mongodb</br>
		```curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://{IP}:{Port}/connectors/ -d @mongodb-source.json```</br>
			Với IP là ip của máy chủ, port là port của connect container (xem trong docker-compose.yaml)</br>
		- Khởi tạo 1 document bất kì trong database dể kafka tạo topic và thiết lập giám sát.
