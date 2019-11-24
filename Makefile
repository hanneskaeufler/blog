dev:
	docker build -t hanneskaeufler/blog-dev:latest -f Dockerfile.dev .
	docker run --rm -it hanneskaeufler/blog-dev:latest

dev-server:
	docker build -t hanneskaeufler/blog-dev:latest -f Dockerfile.dev .
	docker run \
		--rm \
		--volume "$(shell pwd):/app" hanneskaeufler/blog-dev:latest /bin/sh -c 'npm audit fix'

.PHONY: dev dev-server
