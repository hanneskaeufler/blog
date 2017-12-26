FROM crystallang/crystal:0.23.1

# install yarn
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y curl && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb https://dl.yarnpkg.com/debian/ stable main' | tee /etc/apt/sources.list.d/yarn.list && \
    curl -sL https://deb.nodesource.com/setup_9.x | bash - && \
    apt-get install -y nodejs yarn

# add application code
ADD . /app
WORKDIR /app

# install app dependencies (crystal)
RUN crystal deps

# install app dependencies (node)
RUN yarn install

RUN crystal build src/server.cr
CMD ./server
