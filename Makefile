# .env ファイルを読み込む
include .env
export

.PHONY: build
build:
	docker buildx bake --file compose.yml

.PHONY: up
up:
	docker compose up -d

.PHONY: down
down:
	docker compose --profile "*" down --remove-orphans

.PHONY: migrate
migrate:
	docker compose exec -T db mysql -u${DB_USER} -p${DB_PASSWORD} ${DB_SCHEMA} < blog_erd.sql

.PHONY: build-erd
build-erd: up
	mkdir -p ./erd
	rm -rf ./erd/*
	docker compose run --rm builder sh -c "tbls out -t json -o schema.json \"mysql://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:3306/${DB_SCHEMA}\" && npx --yes @liam-hq/cli erd build --format=tbls --input schema.json && mv dist/* ."

.PHONY: view-erd
view-erd:
	docker compose --profile viewer up -d
	open http://localhost:8080
