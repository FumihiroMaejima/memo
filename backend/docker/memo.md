# Docker Memo

---

# Make Volume
## create volume
```shell-sesshion
$ docker volume create test-volume
test-volume

$ docker volume ls
DRIVER    VOLUME NAME
local     test-volume
```

## inspect
```shell-sesshion
$ docker volume inspect test-volume
[
    {
        "CreatedAt": "2021-01-01T13:19:55Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/test-volume/_data",
        "Name": "test-volume",
        "Options": {},
        "Scope": "local"
    }
]
```

## remove volume
```shell-sesshion
$ docker volume rm test-volume
test-volume
```

---

# Make Network
## create network
```shell-sesshion
$ docker network create test-network
testhashc7334d4bc74f434a203f744941d6bd2f2856bb657df546582df95f8bd

$ docker network ls
NETWORK ID     NAME            DRIVER    SCOPE
a28b9a9ctest   test-network     bridge    local
```

## inspect
```shell-sesshion
$ docker network inspect test-network
[
    {
        "Name": "test-network",
        "Id": "testhashc7334d4bc74f434a203f744941d6bd2f2856bb657df546582df95f8bd",
        "Created": "2021-01-01T13:48:12.247950887Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {},
        "Options": {},
        "Labels": {}
    }
]
```

## remove network
```shell-sesshion
$ docker network rm test-network
```

---