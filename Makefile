up:
	docker-compose up -d
bash:
	docker exec -it --user root hive bash 
beeline:
	docker exec -it --user root hive beeline -u jdbc:hive2://localhost:10000/default

down:
	docker-compose down