npx create-strapi-app@latest app --skip-cloud --js --install --no-git-init --example --no-run --dbclient=mysql --dbhost=db --dbport=3306 --dbname=strapi --dbusername=strapi --dbpassword=strapi

cp ./.dockerignore ./app/.dockerignore
cp ./Dockerfile ./app/Dockerfile
cp ./.env ./app/.env
cp ./entrypoint.sh ./app/entrypoint.sh
chmod +x ./app/entrypoint.sh
chmod +x ./entrypoint.sh

cd ./app && touch yarn.lock && yarn install && docker buildx build . --output type=docker,name=elestio4test/strapi-mysql-development:latest | docker load && cd ..