
```
docker run -d \
 -p 3478:3478 -p 3478:3478/udp \
 -p 5349:5349 -p 5349:5349/udp \
 -p 49152-65535:49152-65535/udp \
 coturn/coturn
```

```aiignore
docker run -d --network=host \
 -v $(pwd)/my.conf:/my/coturn.conf \
 coturn/coturn -c /my/coturn.conf
```

```aiignore
docker run -d --network=host coturn/coturn
```