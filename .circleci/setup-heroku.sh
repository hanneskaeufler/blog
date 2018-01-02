#!/bin/bash

wget https://cli-assets.heroku.com/heroku-cli/channels/stable/heroku-cli-linux-x64.tar.gz -O heroku.tar.gz
tar -xvzf heroku.tar.gz
mkdir -p /usr/local/lib /usr/local/bin
mv heroku-cli-v6.14.43-73d5876-linux-x64 /usr/local/lib/heroku
ln -s /usr/local/lib/heroku/bin/heroku /usr/local/bin/heroku

cat > ~/.netrc << EOF
machine api.heroku.com
login $HEROKU_LOGIN
password $HEROKU_API_KEY
EOF

cat >> ~/.ssh/config << EOF
    VerifyHostKeyDNS yes
    StrictHostKeyChecking no
EOF
