dev:
	docker build -t hanneskaeufler/blog-dev:latest -f Dockerfile.dev .

dev-server:
	docker-compose up

.PHONY: dev dev-server
