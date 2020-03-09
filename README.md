[![CircleCI](https://circleci.com/gh/hanneskaeufler/blog.svg?style=svg)](https://circleci.com/gh/hanneskaeufler/blog)  [![codecov](https://codecov.io/gh/hanneskaeufler/blog/branch/master/graph/badge.svg)](https://codecov.io/gh/hanneskaeufler/blog) ![Mutation Score Badge](https://badge.stryker-mutator.io/github.com/hanneskaeufler/blog/master)

# blog

This is my personal website/blog written using [Lucky](https://luckyframework.org). Enjoy!

### Setting up the project

1. [Install required dependencies](http://luckyframework.org/guides/installing.html#install-required-dependencies)
1. Run `script/setup`
1. Run `lucky dev` to start the app

### Development

This is a bit of an experiment to be as pedantic about each and every bit of code as we can be realistically.
The following checks are run (see also `.circleci/config.yml`):

| Check | Description |
| ----  | ------------|
| Static analysis| Checks for unused variables etc. Run with `./bin/ameba` |
| Code formatting | Can check formatting with `crystal tool format --check` and also autofix when omitting `--check` |
| Unit tests | Run em with `crystal spec` |
| Integration tests | Some of the tests hit the database and are not necessarily micro-test. Run em through the same runner with `crystal spec` |
| Visual regression tests | Uses [backstopjs](https://github.com/garris/BackstopJS). Was a bit trickier to get running smoothly on CI. Needs a few pointers, see below. Run with `npm test` |
| CSS linting | Uses stylelint, run with `rpm run lint` |
| Automated code review | Pull requests trigger a run of `danger-js` which looks for basics like PR descriptions, small-ish PRs. |
| Accessibility testing | The chrome dev tools can analyse contrast etc. Run with `npm run accessibility-test` which uses a script heavily based on [Google Chrome's a11y dev tools](https://github.com/GoogleChrome/accessibility-developer-tools) |
| Security testing | On the frontend side we can make sure not to have major security holes in the dependencies, which is checked by `npm audit` |
| Mutation testing | We can inject intentional code changes that must fail the test-suite to check if they do. This is using my own mutation test librabry [crytic](https://github.com/hanneskaeufler/crytic) |

- [ ] Performance testing

#### Visual regression testing

* To generate reference images on the mac, run `docker run --rm -v $(pwd):/src hanneskaeufler/crystal-node-ruby:0.25.1 backstop --config=/src/backstop.js`
* Switch the host in `backstop.json` to `host.docker.internal:5000`, see [docker guides](https://docs.docker.com/docker-for-mac/networking/#use-cases-and-workarounds)
* To export the local visual regression test database, run `/Applications/Postgres.app/Contents/Versions/10/bin/pg_dump --no-acl --no-owner --data-only --table=posts blog_visual_test > blog_visual_test.dump`
* Also, duh: https://github.com/garris/BackstopJS/issues/796


### Learning Lucky

Lucky uses the [Crystal](https://crystal-lang.org) programming language. You can learn about Lucky from the [Lucky Guides](http://luckyframework.org/guides).

### Deploying manually

This project is continually deployed with a workflow on circleci. You can however deploy manually:
Run `git push heroku master`. To export/import the database see: https://devcenter.heroku.com/articles/heroku-postgres-import-export#import-to-heroku-postgres

### Deploying locally with Docker

Start the database and app by running `docker-compose up`.
Run  `docker-compose run app crystal tasks.cr -- db.migrate` to setup the db.
