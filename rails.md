# Commands:

```bash
bundle check || bundle install --path /app/heroku/ruby/bundle --jobs 10
rails assets:precompile # debug: sass file_name.scss result/filename.css
```

# Docker
- Dockerfile
```dockerfile
FROM sanhphanvan/rails-2.5.1

# install oh-my-zsh
RUN apt-get install -y zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install nano
RUN apt-get install -y nano

# Generate secret key
ENV SECRET_KEY_BASE $(openssl rand -base64 32)

# export env vars during run time
RUN mkdir -p /app/.profile.d/
RUN echo "cd /app/user/" > /app/.profile.d/home.sh
RUN echo "export PATH=\"$PATH\" GEM_PATH=\"$GEM_PATH\" GEM_HOME=\"$GEM_HOME\" SECRET_KEY_BASE=\"\${SECRET_KEY_BASE:-$SECRET_KEY_BASE}\" BUNDLE_APP_CONFIG=\"$BUNDLE_APP_CONFIG\"" > /app/.profile.d/ruby.sh

# Make sure private dependencies are copied
COPY ./vendor /app/user/vendor

# Run bundler to cache dependencies
COPY ["Gemfile", "Gemfile.lock", "/app/user/"]
RUN /bin/bash -c "bundle check || bundle install --path /app/heroku/ruby/bundle --jobs 10"

# run npm or yarn install
# add yarn.lock to .slugignore in your project
ADD package*.json yarn.* .npmr* /app/user/
RUN [ -f yarn.lock ] && yarn install --no-progress || npm install

# Add all files
ADD . /app/user

COPY ./init.sh /usr/bin/init.sh
RUN chmod +x /usr/bin/init.sh

# precompile assets (production)
RUN bundle exec rake assets:precompile

ENTRYPOINT ["/usr/bin/init.sh"]
```

- init.sh
```bash
#!/bin/bash

# just keep going if we don't have anything to install
set +e

# export secret before anything
source /app/.profile.d/ruby.sh


# if [ "$RAILS_ENV" == "production" ]; then
#   bundle exec rake assets:precompile
# fi

# for SCRIPT in $POST_RUN_SCRIPT_PATH/*; do
#   [ -f "$SCRIPT" ] || continue
#   set -x;
#   source $SCRIPT;
#   { set +x; } 2>/dev/null
# done

set -e

exec "$@"
```
- .dockerignore
```
node_modules
npm-debug.log
Dockerfile*
docker-compose*
.dockerignore
.git
.gitignore
.env
*/bin
*/obj
README.md
LICENSE
.vscode

# docker
docker/db
```
- docker-compose.yml
```yml
version: '2.1'

services:
  rails-server:
    image: rails-server
    container_name: rails-server
    build: .
    environment:
      MYSQL_DATABASE: ${MYSQL_DATABASE}
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
      # Rails production env
      RAILS_ENV: ${RAILS_ENV}
      RAILS_LOG_TO_STDOUT: ${RAILS_LOG_TO_STDOUT}
    ports:
      - 3000:3000
    # command: tail -f /dev/null
    command: rails server -e production
    volumes:
      - /app/heroku/ruby/bundle
      - ./public/assets:/app/user/public/assets
  db:
    container_name: rails-db
    image: mysql/mysql-server:5.7
    environment:
      MYSQL_DATABASE: ${MYSQL_DATABASE}
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
    volumes:
      - ./docker/db/mysql:/var/lib/mysql
  phpmyadmin:
    container_name: rails-phpmyadmin
    image: phpmyadmin/phpmyadmin
    ports:
        - '8081:80'
    environment:
      PMA_ARBITRARY: 1
      PMA_HOST: db
      PMA_USER: ${MYSQL_USER}
      PMA_PASSWORD: ${MYSQL_PASSWORD}
    depends_on:
        - db
```
