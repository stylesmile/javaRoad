docker pull theiaide/theia

docker run -it -d -p 3001:3000 -v "/root/theiaide-project-cached:/home/project:cached" theiaide/theia