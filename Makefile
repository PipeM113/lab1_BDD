up:
	docker-compose up -d

down:
	docker-compose down

build:
	docker-compose build

restart:
	docker-compose down
	docker-compose up -d

pull:
	docker pull cassandra:latest

bash1:
	docker exec -it nodo1 bash

bash2:
	docker exec -it nodo2 bash

bash3:
	docker exec -it nodo3 bash

run: build up