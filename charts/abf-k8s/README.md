# abf-k8s

Kubernetes deployment for Abiotic Factor dedicated server. This chart uses [Pleuts abiotic-factor-linux-docker](https://github.com/Pleut/abiotic-factor-linux-docker) docker image. 

## Usage

If your are using a PVC then it should be fine to leave out nodeSelector, Otherwise you probably want to pin to a specific node.


```bash
helm repo add radical-egg https://radical-egg.github.io/pineapple-bun/
helm repo update
helm install abiotic-factor-gameserver radical-egg/abf-k8s \
    --set SteamServerName="Eggs server" \
    --set ServerPassword="changethispassword" \
    --set nodeSelector.gameserver=abf-node
```

## Configurations

| Config                            | Description                                                               | Default                                           |
| --------                          | -------                                                                   | -------                                           |
| image.repository                  | The image repository                                                      |   ghcr.io/pleut/abiotic-factor-linux-docker       |
| image.tag                         | The tag for the image                                                     |   latest                                          |
| MaxServerPlayers                  | Max amount of players that can join the server                            |   6                                               |
| GamePort                          | The game port for the steamcmd server                                     |   30000                                           |
| QueryPort                         | The query/steam port for the steamcmd server                              |   30001                                           |
| ServerPassword                    | The password for the server                                               |   changeme                                        |
| SteamServerName                   | The name of the server                                                    |   "ABF K8s"                                       |
| NoAsyncLoadingThread              | The NoAsyncLoadingThread server option                                    |   true                                            |
| WorldSaveName                     | The name of the world save                                                |   Cascade                                         |
| AutoUpdate                        | Automatic updates                                                         |   true                                            |
| UsePerfThreads                    | The UsePerfThreads server option                                          |   true                                            |
| AdditionalEnvironmentVariables    | Additional environment variables                                          |   {}                                              |
| resources                         | resources for the deployment                                              |   limits: { memory: 2Gi, cpu: "1" }               |
| nodeSelector                      | The nodeSelector for the deployment                                       |   {}                                              |
| storage.kind                      | The kind of storage to use (hostvol or persistentVolumeClaim)             |   hostvol                                         |
| storage.hostvol.path              | The host volume path (applies to kind: hostvol)                           |   /data/abf                                       |
| storage.pvc.size                  | The size of the pvc (applies to kind: persistentVolumeClaim)              |   5Gi                                             |
| storage.pvc.storageClassName      | The storageClassName for the pvc (applied to kind: persistentVolumeClaim) |   false                                           |
| networking.type                   | The networking type of the service                                        |   LoadBalancer                                    |
| networking.publishQueryPort       | Publish the QueryPort                                                     |   true                                            |
| networking.nodePort               | The nodePort for the GamePort and QueryPort                               |   30000                                           |

