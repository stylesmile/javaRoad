docker run --name pg -e POSTGRES_PASSWORD=12345678 -p 5432:5432 -d postgres

docker update --restart=always pg 

##  postgres:16
docker run --name pg16 -e POSTGRES_PASSWORD=12345678 -p 5432:5432 -d postgres:16

docker update --restart=always pg16 