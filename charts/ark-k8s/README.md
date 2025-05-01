# ark-k8s

Kubernetes deployment for ARK Survival Evolved dedicated server. This chart uses [Hermsi1337/docker-ark-server](https://github.com/Hermsi1337/docker-ark-server) docker image.

## Usage

```bash
helm repo add radical-egg https://radical-egg.github.io/pineapple-bun/
helm repo update
helm install ark-gameserver radical-egg/ark-k8s \
    --set SESSION_NAME="Eggs server" \
    --set SERVER_PASSWORD="changeme" \
    --set ADMIN_PASSWORD="changeme_admin" \
    --set BACKUP_ON_STOP="true" \
    --set nodeSelector.gameserver=ark-node
```
## Storage Defaults

storage.kind can be set to `hostvol` or `persistentVolumeClaim`.

You can update specific game configurations by updating the GameUserSettings.ini or Game.ini config files. Here is what the docker image documentation
states to do. 

>   The main config files are located at the following path in the container:    
    /app/server/ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini
    /app/server/ShooterGame/Saved/Config/LinuxServer/Game.ini


| Variable                                          | Default                               |
| --------                                          | -------                               |
| storage.kind                                      | hostvol                               |
| storage.hostvol.gamefiles                         | /data/ark-gamefiles                   |
| storage.hostvol.backups                           | /data/ark-backups                     |
| storage.pvc.gamefiles.size                        | 5Gi                                   |
| storage.pvc.gamefiles.storageClassName            | false                                 |
| storage.pvc.backups.size                          | 1Gi                                   |
| storage.pvc.backups.storageClassName              | false                                 |

## Networking Defaults

| Variable                              | Default           |
| --------                              | -------           |
| networking.type                       | LoadBalancer      |
| networking.publishRconPort            | true              |
| networking.publishQueryPort           | true              |

## Environment Variables

| Variable                          | Default                       |
| --------                          | -------                       |
| SESSION_NAME                      | "ARK K8s"                     |
| SERVER_MAP                        | "TheIsland"                   |
| SERVER_PASSWORD                   | "changeme"                    |
| ADMIN_PASSWORD                    | "changeme_admin"              |
| MAX_PLAYERS                       | 20                            |
| UPDATE_ON_START                   | false                         |
| BACKUP_ON_STOP                    | false                         |
| PRE_UPDATE_BACKUP                 | true                          |
| WARN_ON_STOP                      | true                          |
| ENABLE_CROSSPLAY                  | false                         |
| DISABLE_BATTLEYE                  | false                         |
| ARK_SERVER_VOLUME                 | /app                          |
| GAME_CLIENT_PORT                  | 7777                          |
| UDP_SOCKET_PORT                   | 7778                          |
| RCON_PORT                         | 27020                         |
| SERVER_LIST_PORT                  | 27015                         |
| GAME_MOD_IDS                      | ""                            |
