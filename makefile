run:
	docker-compose up -d

console:
	docker-compose up -d && docker-compose exec app rails c
