DBNAME ?= blog_development
DBUSER ?= postgres
DUMPFILE ?= blog_development.dump

define load_db_dump
	docker-compose start db && sleep 10
	docker cp $(3) $(shell docker-compose ps -q db):/tmp/
	docker-compose exec db /bin/sh -c 'dropdb -U $(2) $(1); createdb -U $(2) $(1) && pg_restore -U $(2) -d $(1) < /tmp/$(3)'
endef

test:
	docker-compose run app /bin/sh -c 'crystal spec'

dev-server:
	docker-compose up -V

rebuild-dev-server:
	docker-compose up --build -V

load-blog-posts:
	$(call load_db_dump,$(DBNAME),$(DBUSER),$(DUMPFILE))

load-visual-test-posts:
	docker-compose start db && sleep 10
	docker cp blog_visual_test.dump $(shell docker-compose ps -q db):/tmp/
	docker-compose exec app /bin/sh -c 'crystal tasks.cr -- db.migrate'
	docker-compose exec db /bin/sh -c 'dropdb -U $(DBUSER) blog_development createdb -U $(DBUSER) blog_development && psql -U $(DBUSER) -d blog_development < /tmp/blog_visual_test.dump'

.PHONY: dev-server rebuild-dev-server test
