run:
	docker-compose up -d

console:
	docker-compose up -d && docker-compose exec app rails c

migrate:
  docker-compose exec app rails db:migrate
