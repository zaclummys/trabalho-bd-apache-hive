up:
	docker compose -f hive/docker-compose.yml up -d
bash:
	docker compose -f hive/docker-compose.yml exec --user root hive-server bash 
beeline:
	docker compose -f hive/docker-compose.yml exec --user root hive-server beeline -u jdbc:hive2://localhost:10000/default
down:
	docker compose -f hive/docker-compose.yml down