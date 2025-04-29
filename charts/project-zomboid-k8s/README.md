# project-zomboid-k8s

Kubernetes deployment for Project Zomboid dedicated server. This chart uses [Renegade-Master/zomboid-dedicated-server](https://github.com/Renegade-Master/zomboid-dedicated-server) docker image.

## Storage Defaults

storage.kind can be set to `hostvol` or `persistentVolumeClaim`.

| Variable                                          | Default                               |
| --------                                          | -------                               |
| storage.kind                                      | hostvol                               |
| storage.hostvol.gamefiles                         | /data/project-zomboid-gamefiles       |
| storage.hostvol.configfiles                       | /data/project-zomboid-configfiles     |
| storage.pvc.gamefiles.size                        | 5Gi                                   |
| storage.pvc.gamefiles.storageClassName            | false                                 |
| storage.pvc.configfiles.size                      | 1Gi                                   |
| storage.pvc.configfiles.storageClassName          | false                                 |

## Networking Defaults

| Variable                              | Default           |
| --------                              | -------           |
| networking.type                       | LoadBalancer      |
| networking.publishRconPort            | true              |
| networking.publishQueryPort           | true              |


## Environment Variables

| Variable              | Default           |
| --------              | -------           |
| ADMIN_USERNAME        | superuser         |
| ADMIN_PASSWORD        | superuser         |
| BIND_IP               | 0.0.0.0           |
| GAME_VERSION          | public            |
| GC_CONFIG             | ZGC               |
| MAP_NAMES             | Muldraugh, KY     |
| MAX_RAM               | 4096m             |
| STEAM_VAC             | true              |
| TZ                    | UTC               |
| USE_STEAM             | true              |
| AUTOSAVE_INTERVAL     | 15m               |
| DEFAULT_PORT          | 16261             |
| MAX_PLAYERS           | 16                |
| MOD_NAMES             | ""                |
| MOD_WORKSHOP_IDS      | ""                |
| PAUSE_ON_EMPTY        | true              |
| PUBLIC_SERVER         | true              |
| RCON_PASSWORD         | changeme_rcon     |
| RCON_PORT             | 27015             |
| SERVER_NAME           | Mirror Image      |
| SERVER_PASSWORD       | changeme          |
| UDP_PORT              | 16262             |

## Usage

```bash
helm repo add radical-egg https://radical-egg.github.io/pineapple-bun/
helm repo update
helm install pz-release radical-egg/project-zomboid-k8s \
	--set SERVER_NAME="Kuberts ZomboidK8s" \
	--set SERVER_PASSWORD="foobar" \
	--set ADMIN_PASSWORD="foobar2admin" \
	--set nodeSelector.gameserver=small 
```

If you are planning to use type: NodePort be sure to set your environment variable ports as well. UDP_PORT will be nodePort+1 and RCON_PORT will be nodePort+2

```bash
helm install pz-release radical-egg/project-zomboid-k8s \
	--set SERVER_NAME="Kuberts ZomboidK8s" \
	--set SERVER_PASSWORD="foobar" \
	--set ADMIN_PASSWORD="foobar2admin" \
	--set nodeSelector.gameserver=small  \
    --set nodePort=30000 \
    --set DEFAULT_PORT=30000 \
    --set UDP_PORT=30001 \
    --set RCON_PORT=30002 \
    --set networking.type="NodePort"
```
