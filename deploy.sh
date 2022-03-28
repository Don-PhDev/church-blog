git checkout .
git pull
docker stop designer_web_1
docker stop designer_db_1
docker-compose up -d --build
docker exec -it designer_web_1 bin/bundle install
docker exec -it designer_web_1 bin/rails db:create
docker exec -it designer_web_1 bin/rails db:migrate
docker exec -it designer_web_1 bin/rails webpacker:install
docker exec -it designer_web_1 bin/rails dev:cache
