## nginx https config

```nginx
server {
    listen 9020 ssl;
    server_name  localhost;

    ssl_certificate  /opt/nginx/common/ssl.crt;
    ssl_certificate_key /opt/nginx/common/ssl.key;

    ssl_session_cache shared:SSL:1m;
    ssl_session_timeout 10m;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;

    location / {
        proxy_pass http://127.0.0.1:9010;
        #proxy_set_header Host $host;
        #proxy_set_header X-Real-IP $remote_addr;
    }
}

```