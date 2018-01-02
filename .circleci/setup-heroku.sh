#!/bin/bash
cat > ~/.netrc << EOF
machine api.heroku.com
    login $HEROKU_LOGIN
    password $HEROKU_API_KEY
EOF

cat > ~/.netrc << EOF
machine git.heroku.com
    login $HEROKU_LOGIN
    password $HEROKU_API_KEY
EOF

ssh-keyscan -H heroku.com >> ~/.ssh/known_hosts

cat >> ~/.ssh/config << EOF
VerifyHostKeyDNS yes
StrictHostKeyChecking no
EOF
