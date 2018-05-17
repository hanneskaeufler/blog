[![CircleCI](https://circleci.com/gh/hanneskaeufler/blog.svg?style=svg)](https://circleci.com/gh/hanneskaeufler/blog)

# blog

This is my personal website/blog written using [Lucky](https://luckyframework.org). Enjoy!

### Setting up the project

1. [Install required dependencies](http://luckyframework.org/guides/installing.html#install-required-dependencies)
1. Run `bin/setup`
1. Run `lucky dev` to start the app

### Development

This is a bit of an experiment to be as pedantic about each and every bit of code as we can be realistically.
The following checks are run (see also `.circleci/config.yml`):

* Static analysis on crystal code with `./bin/ameba`
* Code formatting checks on crystal code with `crystal tool format --check`
* Unit / Integration tests with `crystal spec`
* Visual regression testing with `yarn test` (using backstopjs)
    - To generate reference images on the mac, run `docker run --rm -v $(pwd):/src backstopjs/backstopjs test/approve`
    - Switch the host in `backstop.json` to `host.docker.internal:5000`, see [docker guides](https://docs.docker.com/docker-for-mac/networking/#use-cases-and-workarounds)
    - To export the local visual regression test database, run `/Applications/Postgres.app/Contents/Versions/10/bin/pg_dump --no-acl --no-owner --data-only --table=posts blog_visual_test > blog_visual_test.dump`
    - Also, duh: https://github.com/garris/BackstopJS/issues/796
* CSS linting with `yarn lint` (using stylelint)
* Pull request trigger a run of `danger-js` which tries to do the following:
    * Keep `node` dependencies in check with `danger-plugin-yarn`
    * Avoid "fixme/todo" comments in code
* Accessibility testing with the chrome developer tools via `yarn accessibility-test`
    * It is based on [Google Chrome's a11y dev tools](https://github.com/GoogleChrome/accessibility-developer-tools)

- [ ] Performance testing
- [ ] Mutation testing

### Learning Lucky

Lucky uses the [Crystal](https://crystal-lang.org) programming language. You can learn about Lucky from the [Lucky Guides](http://luckyframework.org/guides).

### Deploying manually

This project is continually deployed with a workflow on circleci. You can however deploy manually:
Run `git push heroku master`. To export/import the database see: https://devcenter.heroku.com/articles/heroku-postgres-import-export#import-to-heroku-postgres

### Deploying locally with Docker

Start the database and app by running `docker-compose up`.
Run  `docker-compose run app crystal tasks.cr -- db.migrate` to setup the db.
