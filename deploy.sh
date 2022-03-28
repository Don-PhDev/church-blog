git checkout .
git pull
docker stop churchblog_web_1
docker stop churchblog_db_1
docker-compose up -d --build
docker exec -it churchblog_web_1 bin/bundle install
docker exec -it churchblog_web_1 bin/rails db:create
docker exec -it churchblog_web_1 bin/rails db:migrate
#docker exec -it churchblog_web_1 bin/rails webpacker:install
#docker exec -it churchblog_web_1 bin/rails dev:cache
