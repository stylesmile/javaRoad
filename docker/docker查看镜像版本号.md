### docker查看镜像版本号
```docker
docker image inspect minio/minio:latest | grep -i version
```

```docker
root@yisu-65e1c42956d76:~# docker image inspect minio/minio:latest | grep -i version
        "DockerVersion": "",
                "io.buildah.version": "1.29.0",
                "version": "RELEASE.2024-02-26T09-33-48Z"
```