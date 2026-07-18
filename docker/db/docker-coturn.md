# Coturn TURN/STUN Server (Docker)

[Coturn](https://github.com/coturn/coturn) 是一个开源的 TURN/STUN 服务器，用于 WebRTC 等需要 NAT 穿透的实时通信场景。

## 快速启动

### 使用默认配置（host 网络模式）

```bash
docker run -d --network=host coturn/coturn
```

### 指定端口映射

```bash
docker run -d \
  -p 3478:3478 -p 3478:3478/udp \
  -p 5349:5349 -p 5349:5349/udp \
  -p 49152-65535:49152-65535/udp \
  coturn/coturn
```

### 挂载自定义配置文件

```bash
docker run -d --network=host \
  -v $(pwd)/turnserver.conf:/etc/turnserver.conf \
  coturn/coturn -c /etc/turnserver.conf
```

## 配置文件示例

创建 `turnserver.conf`：

```ini
# 监听端口
listening-port=3478
tls-listening-port=5349

# 服务器公网 IP（替换为你的实际 IP）
external-ip=YOUR_PUBLIC_IP

# 认证配置
realm=your-domain.com
lt-cred-mech
user=username:password

# 日志
log-file=stdout
verbose

# 中继端口范围
min-port=49152
max-port=65535
```

## Docker Compose

```yaml
version: "3.8"
services:
  coturn:
    image: coturn/coturn
    container_name: coturn
    network_mode: host
    restart: unless-stopped
    volumes:
      - ./turnserver.conf:/etc/turnserver.conf
    command: -c /etc/turnserver.conf
```

## 端口说明

| 端口 | 协议 | 用途 |
|------|------|------|
| 3478 | TCP/UDP | STUN/TURN 默认端口 |
| 5349 | TCP/UDP | STUN/TURN over TLS |
| 49152-65535 | UDP | 中继数据端口范围 |

## 验证服务

使用浏览器访问 [Trickle ICE](https://webrtc.github.io/samples/src/content/peerconnection/trickle-ice/) 测试：

1. 清除默认的 STUN 服务器
2. 添加 `stun:YOUR_IP:3478`
3. 添加 `turn:YOUR_IP:3478`（用户名/密码填配置中的值）
4. 点击 Gather candidates，确认能获取到 relay 类型的候选地址

## 常见问题

**防火墙**：确保开放 3478、5349 端口以及 49152-65535 UDP 端口范围。

**NAT 部署**：如果服务器在 NAT 后面，必须在配置中正确设置 `external-ip` 为公网 IP。

**Docker 网络模式**：`--network=host` 模式最简单，端口映射模式需要暴露大量 UDP 端口范围。

```turnserver.conf
# 监听端口
listening-port=3478
tls-listening-port=5349

# 外网IP（替换为你的服务器公网IP）
external-ip=你的公网IP

# 域名（可选）
realm=yourdomain.com

# 用户名密码（用于客户端认证）
user=rtcuser:rtcpassword

# 不允许匿名访问
no-cli

# 日志
log-file=/var/log/turnserver.log
verbose
```

## 在线测试
```
https://webrtc.github.io/samples/src/content/peerconnection/trickle-ice/
```