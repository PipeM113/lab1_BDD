# Otras tareas
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

create-keyspace:
	docker exec -it nodo1 cqlsh -e "CREATE KEYSPACE IF NOT EXISTS universia_keyspace WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3};"

create-tables:
	docker exec -it nodo1 cqlsh -e "USE universia_keyspace; CREATE TABLE IF NOT EXISTS postulantes_por_carrera (carrera TEXT, periodo INT, cedula INT, estado TEXT, facultad TEXT, puntaje_psu INT, PRIMARY KEY ((carrera), periodo, cedula));"

