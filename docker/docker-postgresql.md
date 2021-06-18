docker run --name postgres -e POSTGRES_PASSWORD=12345678 -p 5432:5432 -d postgres

docker update --restart=always redis 
